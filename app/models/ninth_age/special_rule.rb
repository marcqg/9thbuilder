class NinthAge::SpecialRule < ApplicationRecord

  belongs_to :version, class_name: "NinthAge::Version"
  belongs_to :army, class_name: "NinthAge::Army"

  has_many :special_rule_unit_troops, dependent: :destroy

  translates :name, :description
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  enum type_lvl: { Global: 0, Defensive: 1, Offensive: 2}

  def name_with_version
    "#{name} - #{version.name}"
  end

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
