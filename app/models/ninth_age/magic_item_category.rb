class NinthAge::MagicItemCategory < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  
  has_many :magic_items, dependent: :destroy, class_name: "NinthAge::MagicItem"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
