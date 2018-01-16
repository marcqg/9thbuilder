class NinthAge::Troop < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  
  belongs_to :troop_type, class_name: "NinthAge::TroopType"
  belongs_to :unit, class_name: "NinthAge::Unit"
  delegate :army, :to => :unit, :allow_nil => true
  delegate :version, :to => :unit, :allow_nil => true
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

  ransacker :by_army, proc{ |v|
    data = NinthAge::Troop.joins(:unit)
                          .where(ninth_age_units: {army_id: v})
                          .map(&:id)
    data = data.present? ? data : nil
  } do |parent|
    # some other code..
  end

  ransacker :by_version, proc{ |v|
    data = NinthAge::Troop.joins(:unit)
                          .joins("INNER JOIN ninth_age_armies ON ninth_age_armies.id = ninth_age_units.army_id")
                          .where(ninth_age_armies: { version_id: v })
                          .map(&:id)
    data = data.present? ? data : nil
  } do |parent|
    # some other code..
  end
end
