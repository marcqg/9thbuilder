class NinthAge::Unit < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes
  self.per_page = 18

  belongs_to :army, class_name: "NinthAge::Army"
  delegate :version, :to => :army, :allow_nil => true

  belongs_to :unit_type, class_name: "NinthAge::UnitType"
  
  has_and_belongs_to_many :organisations, class_name: "NinthAge::Organisation"

  has_many :paint_list_units, dependent: :destroy, class_name: 'Paint::PaintListUnit'

  has_many :army_list_units, dependent: :destroy, class_name: 'Builder::ArmyListUnit'
  has_many :equipment_unit_troops, -> { order :position }, dependent: :destroy, class_name: "NinthAge::EquipmentUnitTroop"
  has_many :equipments, through: :equipment_unit_troops, class_name: "NinthAge::Equipment"
  has_many :special_rule_unit_troops, -> { order :position }, dependent: :destroy, class_name: "NinthAge::SpecialRuleUnitTroop"
  has_many :special_rules, through: :special_rule_unit_troops, class_name: "NinthAge::SpecialRule"
  has_many :troops, -> { order :position }, dependent: :destroy, class_name: "NinthAge::Troop"
  has_many :unit_options, -> { order %w(parent_id position) }, dependent: :destroy, class_name: "NinthAge::UnitOption"
  has_many :mount_options, foreign_key: 'mount_id', dependent: :nullify, class_name: 'NinthAge::UnitOption'
  has_many :unit_link_options, foreign_key: 'unit_link_id', dependent: :nullify, class_name: 'NinthAge::UnitOption'
  has_many :organisation_changes, dependent: :destroy, class_name: "NinthAge::OrganisationChange"

  enum type_carac: {V1: 0, V2: 1}
  enum size: {Standard: 0, Large: 1, Gigantic: 2}
  enum base: { TwentyTwenty: 0, TwentyFiveTwentyFive: 1, FortyForty: 2, TwentyFiveFifty: 4, FiftyFifty: 5, FiftySeventyFive: 6, FiftyHundred: 7, SixtyHundred: 8, SixtyRound: 9, FortyTwenty: 10, FortySixty: 11, HundredFiftyHundred: 12, SeventyFiveRound: 13, FortyRound: 14, SeventyFiveFifty: 15, HundredHundred: 16 , HundredFifty: 17, TwentyFiveRound: 18, SeventyFiveHundred: 19}

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  normalize_attributes :magic, :notes

  acts_as_list scope: :army

  validates :type_carac, presence: true
  validates :unit_type_id, presence: true, if: ->(unit){unit.V2?}
  validates :army_id, :min_size, presence: true
  validates :min_size, numericality: {greater_than: 0, only_integer: false}
  validates :max_size, numericality: {greater_than: 0, only_integer: true, allow_nil: false}
  validates :max, numericality: {greater_than_or_equal_to: 0, only_integer: true, allow_nil: false}
  validates :max_model, numericality: {greater_than_or_equal_to: 0, only_integer: true, allow_nil: true}
  validates :position, numericality: {greater_than: 0, only_integer: true, allow_nil: true}
  validates :value_points, presence: true, numericality: {greater_than_or_equal_to: 0, allow_nil: false}

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  scope :ordered, -> { order("ninth_age_unit_translations.name ASC") }

  scope :mount_category, -> { where(is_mount: true) }


  def display_size
    I18n.t("unit.size.#{size}", default: size.titleize)
  end

  def display_base
    I18n.t("unit.base.#{base}", default: base.titleize)
  end

  def self.for_paint_select(paint_list)    
    paint_list.army.organisations.includes(:translations).map do |organisation|
      [
          organisation.name,
          organisation.units.includes(:translations)
              .order('ninth_age_unit_translations.name')
              .map { |u| [u.name, u.id] }
      ]
    end
  end

  def duplicate
    new_troops = {}
    new_unit_options = {}

    new_unit = dup
    new_unit.latex_key = nil
    new_unit.troops << troops.collect { |troop| new_troops[troop.id] = troop.dup }
    new_unit.equipment_unit_troops << equipment_unit_troops.collect(&:dup)
    new_unit.special_rule_unit_troops << special_rule_unit_troops.collect(&:dup)
    new_unit.unit_options << unit_options.collect { |unit_option| new_unit_options[unit_option.id] = unit_option.dup }
    new_unit.organisation_changes << organisation_changes.collect(&:dup)

    organisations.each do |organisation|
      new_unit.organisations << organisation
    end

    new_unit.troops.map do |troop|
      troop.latex_key = nil
      troop.unit_option = new_unit_options[troop.unit_option.id] unless troop.unit_option.nil?
    end

    new_unit.unit_options.map do |unit_option|
      unit_option.parent = new_unit_options[unit_option.parent.id] unless unit_option.parent.nil?
    end

    new_unit.equipment_unit_troops.each do |equipment|
      equipment.troop = new_troops[equipment.troop_id] unless equipment.troop.nil?
    end

    new_unit.special_rule_unit_troops.each do |rule|
      rule.troop = new_troops[rule.troop_id] unless rule.troop.nil?
    end

    new_unit
  end

  ransacker :version, 
    formatter: proc{ |v|
      data = NinthAge::Unit.joins(:army)
                            .where(ninth_age_armies: { version_id: v })
                            .map(&:id)
      data = data.present? ? data : nil
    }, splat_params: true do |parent|
    parent.table[:id]
  end
end
