class NinthAge::Version < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  has_many :army_lists, dependent: :destroy, class_name: "Builder::ArmyList"

  has_many :armies, dependent: :destroy, class_name: "NinthAge::Army"
  has_many :domain_magics, dependent: :destroy, class_name: "NinthAge::DomainMagic"
  has_many :special_rules, dependent: :destroy, class_name: "NinthAge::SpecialRule"
  has_many :equipments, dependent: :destroy, class_name: "NinthAge::Equipment"
  has_many :extra_items, dependent: :destroy, class_name: "NinthAge::ExtraItem"
  has_many :magic_items, dependent: :destroy, class_name: "NinthAge::MagicItem"
  has_many :magic_standards, dependent: :destroy, class_name: "NinthAge::MagicStandard"

  has_many :events, dependent: :destroy, class_name: "Tournament::Event"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  scope :ordered, -> { order("ninth_age_version_translations.name ASC") }
end
