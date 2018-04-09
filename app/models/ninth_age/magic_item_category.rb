class NinthAge::MagicItemCategory < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes
  
  has_many :magic_items, dependent: :destroy, class_name: "NinthAge::MagicItem"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  scope :ordered, -> { order("ninth_age_magic_item_category_translations.name ASC") }
end
