class NinthAge::UnitType < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes
  
  has_many :units, dependent: :destroy, class_name: "NinthAge::Unit"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
