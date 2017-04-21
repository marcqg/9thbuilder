class MagicItemCategory < ApplicationRecord
  has_many :magic_items, dependent: :destroy

  translates :name
  globalize_accessors

  validates :name, presence: true
end
