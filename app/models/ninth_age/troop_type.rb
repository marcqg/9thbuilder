class NinthAge::TroopType < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  
  has_many :troops, dependent: :destroy, class_name: "NinthAge::Troop"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
