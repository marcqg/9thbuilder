class NinthAge::TroopType < ApplicationRecord
  has_many :troops, dependent: :destroy

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true
end
