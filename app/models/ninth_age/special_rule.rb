class NinthAge::SpecialRule < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :version, class_name: "NinthAge::Version"
  belongs_to :army, class_name: "NinthAge::Army"

  has_many :special_rule_unit_troops, dependent: :destroy, class_name: "NinthAge::SpecialRuleUnitTroop"

  translates :name, :description
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  enum type_lvl: { Global: 0, Defensive: 1, Offensive: 2}

  validates :version_id, presence: true
  validates :type_lvl, presence: true

  scope :ordered, -> { order("ninth_age_special_rule_translations.name ASC") }

  def name_with_version
    "#{name} - #{version.name}"
  end

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
