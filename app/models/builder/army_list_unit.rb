class Builder::ArmyListUnit < ApplicationRecord
  belongs_to :army_list
  belongs_to :unit, :class_name => 'NinthAge::Unit'
  has_many :army_list_unit_troops, -> { order :position }, dependent: :destroy
  has_many :army_list_unit_magic_items, dependent: :destroy
  has_many :army_list_unit_magic_standards, dependent: :destroy
  has_many :army_list_unit_extra_items, dependent: :destroy
  has_many :army_list_unit_unit_options, dependent: :destroy
  has_many :magic_items, -> { select 'ninth_age_magic_items.*, builder_army_list_unit_magic_items.quantity' }, :class_name => 'NinthAge::MagicItem', through: :army_list_unit_magic_items, dependent: :destroy
  has_many :magic_standards, :class_name => 'NinthAge::MagicStandard', through: :army_list_unit_magic_standards, dependent: :destroy
  has_many :extra_items, :class_name => 'NinthAge::ExtraItem', through: :army_list_unit_extra_items, dependent: :destroy
  has_many :unit_options, -> { select 'ninth_age_unit_options.*, builder_army_list_unit_unit_options.quantity' }, :class_name => 'NinthAge::UnitOption', through: :army_list_unit_unit_options, dependent: :destroy

  accepts_nested_attributes_for :army_list_unit_troops
  accepts_nested_attributes_for :army_list_unit_magic_items, allow_destroy: true
  accepts_nested_attributes_for :army_list_unit_unit_options, allow_destroy: true
  accepts_nested_attributes_for :army_list_unit_magic_standards, allow_destroy: true

  normalize_attributes :name, :notes

  validates :army_list_id, :unit_id, :name, :value_points, :size, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0 }
  validates :size, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }

  before_validation on: :create do
    self.name = unit.name if unit.max == 1
    self.name = unit.name + ' #' + (army_list.army_list_units.where(unit_id: unit).count + 1).to_s unless name?
    self.size = 0
    self.value_points = 0.0
    self.notes = unit.notes
    self.magic = unit.magic
  end

  before_save do
    if army_list_unit_troops.empty?
      unit.troops.each do |troop|
        if unit.value_points
          army_list_unit_troops.build troop: troop, size: troop.position == 1 ? unit.min_size : nil, position: troop.position
        else
          army_list_unit_troops.build troop: troop, size: troop.value_points ? troop.min_size : nil, position: troop.position
        end
      end
    end

    self.size = 0
    self.value_points = 0.0

    army_list_unit_unit_options.each do |army_list_unit_unit_option|
      army_list_unit_unit_option.quantity = army_list_unit_troops.first.size.to_i if army_list_unit_unit_option.unit_option.is_per_model
      self.value_points += army_list_unit_unit_option.unit_option.value_points * army_list_unit_unit_option.quantity
    end

    factor = 1
    magic_options = self.unit.unit_options.where({:category => :MagicEquipment}).where("magic_item_factor > 1")
    unless magic_options.empty?
      factor = magic_options.first.magic_item_factor
    end

    army_list_unit_magic_items.each do |army_list_unit_magic_item|
      self.value_points += army_list_unit_magic_item.magic_item.value_points * army_list_unit_magic_item.quantity * factor
    end

    army_list_unit_magic_standards.each do |army_list_unit_magic_standard|
      self.value_points += army_list_unit_magic_standard.magic_standard.value_points
    end

    if unit.value_points
      self.size = army_list_unit_troops.first.size.to_i + size
      self.value_points = unit.value_points + value_points

      if !army_list_unit_troops.first.troop.value_points.nil?
        self.value_points = (army_list_unit_troops.first.size.to_i - unit.min_size) * army_list_unit_troops.first.troop.value_points + value_points
      end
    else
      army_list_unit_troops.reject { |alut| alut.troop.value_points.nil? }.each do |army_list_unit_troop|
        self.size = army_list_unit_troop.size.to_i + size
        self.value_points = army_list_unit_troop.size.to_i * army_list_unit_troop.troop.value_points + value_points
      end
    end
    
    option_extra_items = unit.unit_options.where(:category => [:ArmyAttribut])
    unless option_extra_items.empty?

      factor = 1
      unless option_extra_items.where(:is_per_model => true).empty?
        factor = size
      end
      
      extra_items.each do |extra_item|
        self.value_points += extra_item.value_points * factor
      end
    end
  end

  after_save do
    army_list.value_points = army_list.army_list_units.sum('value_points')
    army_list.save
  end

  after_destroy do
    army_list.value_points = army_list.army_list_units.sum('value_points')
    army_list.save
  end

  acts_as_list scope: :army_list

  def unit_options_value_points
    unit_options.sum('quantity * value_points').to_i
  end

  def magic_items_value_points
    magic_items.sum('quantity * value_points').to_i
  end

  def extra_items_value_points
    factor = 1
    unless unit.unit_options.where(:category => [:ArmyAttribut]).where(:is_per_model => true).empty?
      factor = size
    end
    
    points = 0
    extra_items.each do |extra_item|
      points += extra_item.value_points * factor
    end

    points
  end

  def magic_standards_value_points
    magic_standards.sum('value_points')
  end
end
