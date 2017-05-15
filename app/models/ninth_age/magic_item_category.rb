class NinthAge::MagicItemCategory < ApplicationRecord
  has_many :magic_items, dependent: :destroy

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true
end
