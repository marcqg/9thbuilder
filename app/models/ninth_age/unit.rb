class NinthAge::Unit < ApplicationRecord
  self.per_page = 18

  belongs_to :army, class_name: "NinthAge::Army"

  belongs_to :unit_type, class_name: "NinthAge::UnitType"
  
  has_and_belongs_to_many :organisations, class_name: "NinthAge::Organisation"

  has_many :army_list_units, dependent: :destroy, class_name: 'Builder::ArmyListUnit'
  has_many :equipment_unit_troops, -> { order :position }, dependent: :destroy, class_name: "NinthAge::EquipmentUnitTroop"
  has_many :special_rule_unit_troops, -> { order :position }, dependent: :destroy, class_name: "NinthAge::SpecialRuleUnitTroop"
  has_many :troops, -> { order :position }, dependent: :destroy, class_name: "NinthAge::Troop"
  has_many :unit_options, -> { order %w(parent_id position) }, dependent: :destroy, class_name: "NinthAge::UnitOption"
  has_many :mount_options, foreign_key: 'mount_id', dependent: :nullify, class_name: 'NinthAge::UnitOption'
  has_many :organisation_changes, dependent: :destroy, class_name: "NinthAge::OrganisationChange"

  enum type_carac: {V1: 0, V2: 1}
  enum size: {Standard: 0, Large: 1, Gigantic: 2}
  enum base: { TwentyTwenty: 0, TwentyFiveTwentyFive: 1, FortyForty: 2, TwentyFiveFifty: 4, FiftyFifty: 5, FiftySeventyFive: 6, FiftyHundred: 7, SixtyHundred: 8, SixtyRound: 9, FortyTwenty: 10, FortySixty: 11, HundredFiftyHundred: 12, SeventyFiveRound: 13, FortyRound: 14, SeventyFiveFifty: 15, HundredHundred: 16 , HundredFifty: 17 }

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  normalize_attributes :magic, :notes

  validates :army_id, :min_size, presence: true
  validates :min_size, numericality: {greater_than_or_equal_to: 0, only_integer: true}
  validates :max_size, numericality: {greater_than_or_equal_to: 0, only_integer: true, allow_nil: true}
  validates :max, numericality: {greater_than_or_equal_to: 0, only_integer: true, allow_nil: true}
  validates :max_model, numericality: {greater_than_or_equal_to: 0, only_integer: true, allow_nil: true}
  validates :order, numericality: {greater_than_or_equal_to: 0, only_integer: true, allow_nil: true}
  validates :value_points, presence: true, numericality: {greater_than_or_equal_to: 0, allow_nil: false}

  scope :mount_category, -> { where(is_mount: true) }


  def display_size
    I18n.t("unit.size.#{size}", default: size.titleize)
  end

  def display_base
    I18n.t("unit.base.#{base}", default: base.titleize)
  end

  def self.for_select(army_list)
    army_list_units = army_list.army_list_units.collect(&:unit)

    army_list.army_organisation.organisations.map do |organisation|
      [
          organisation.name,
          organisation.units.includes(:translations)
              .order('max', 'ninth_age_unit_translations.name')
              .reject { |u| u.in?(army_list_units) if u.max == 1 }
              .reject { |u| u.value_points == nil || u.value_points < 1}
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
    new_unit.equipment_unit_troops << equipment_unit_troops.collect(&:dup)
    new_unit.special_rule_unit_troops << special_rule_unit_troops.collect(&:dup)
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
