class NinthAge::Version < ApplicationRecord
  has_many :armies, dependent: :destroy, class_name: "NinthAge::Army"
  has_many :domain_magics, dependent: :destroy, class_name: "NinthAge::DomainMagic"
  has_many :special_rules, dependent: :destroy, class_name: "NinthAge::SpecialRule"
  has_many :equipments, dependent: :destroy, class_name: "NinthAge::Equipment"
  has_many :extra_items, dependent: :destroy, class_name: "NinthAge::ExtraItem"
  has_many :magic_items, dependent: :destroy, class_name: "NinthAge::MagicItem"
  has_many :magic_standards, dependent: :destroy, class_name: "NinthAge::MagicStandard"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
