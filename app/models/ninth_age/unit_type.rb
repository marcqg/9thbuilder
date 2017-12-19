class NinthAge::UnitType < ApplicationRecord
  has_many :units, dependent: :destroy, class_name: "NinthAge::Unit"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
