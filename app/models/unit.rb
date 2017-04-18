class Unit < ApplicationRecord
  self.per_page = 18

  belongs_to :army

  has_and_belongs_to_many :organisations, :class_name => 'NinthAge::Organisation'

  has_many :army_list_units, dependent: :destroy
  has_many :equipments, -> { order 'position' }, dependent: :destroy
  has_many :special_rules, -> { order 'position' }, dependent: :destroy
  has_many :troops, -> { order 'position' }, dependent: :destroy
  has_many :unit_options, -> { order %w(parent_id position) }, dependent: :destroy
  has_many :mount_options, class_name: 'UnitOption', foreign_key: 'mount_id', dependent: :nullify

  translates :name

  normalize_attributes :magic, :notes

  validates :army_id, :name, :min_size, presence: true
  validates :min_size, numericality: {greater_than_or_equal_to: 1, only_integer: true}
  validates :max_size, numericality: {greater_than_or_equal_to: :min_size, only_integer: true, allow_nil: true}
  validates :value_points, numericality: {greater_than_or_equal_to: 0, allow_nil: true}
  validates :is_unique, inclusion: {in: [true, false]}

  def self.for_select(army_list)
    army_list_units = army_list.army_list_units.collect(&:unit)

    army_list.army_organisation.organisations.map do |organisation|
      [
          organisation.name,
          organisation.units.includes(:translations)
              .order('is_unique', 'unit_translations.name')
              .reject { |u| u.in?(army_list_units) if u.is_unique }
              .map { |u| [u.name, u.id] }
      ]
    end
  end

  def duplicate
    new_troops = {}
    new_unit_options = {}

    new_unit = dup
    new_unit.name = "Copy of #{new_unit.name}"
    new_unit.troops << troops.collect { |troop| new_troops[troop.id] = troop.dup }
    new_unit.equipments << equipments.collect(&:dup)
    new_unit.special_rules << special_rules.collect(&:dup)
    new_unit.unit_options << unit_options.collect { |unit_option| new_unit_options[unit_option.id] = unit_option.dup }

    new_unit.troops.map do |troop|
      troop.unit_option = new_unit_options[troop.unit_option.id] unless troop.unit_option.nil?
    end

    new_unit.unit_options.map do |unit_option|
      unit_option.parent = new_unit_options[unit_option.parent.id] unless unit_option.parent.nil?
    end

    new_unit
  end
end
