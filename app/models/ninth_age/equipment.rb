class NinthAge::Equipment < ApplicationRecord
  has_many :equipment_unit_troops, dependent: :destroy

  translates :name, :description
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true
end
