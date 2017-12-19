class NinthAge::Troop < ApplicationRecord
  belongs_to :troop_type, class_name: "NinthAge::TroopType"
  belongs_to :unit, class_name: "NinthAge::Unit"
  belongs_to :unit_option, class_name: "NinthAge::UnitOption"
  has_many :equipment_unit_troops, -> { order :position }, dependent: :destroy, class_name: "NinthAge::EquipmentUnitTroop"
  has_many :special_rule_unit_troops, -> { order :position }, dependent: :destroy, class_name: "NinthAge::SpecialRuleUnitTroop"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  enum type_carac: {V1: 0, V2: 1}

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  validates :unit_id, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }

  acts_as_list scope: :unit

  attr_accessor :army_filter

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end
end
