class NinthAge::Version < ApplicationRecord
  has_many :armies, dependent: :destroy
  has_many :magics, dependent: :destroy
  has_many :special_rules, dependent: :destroy
  has_many :equipments, dependent: :destroy

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
