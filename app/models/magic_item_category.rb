class MagicItemCategory < ApplicationRecord
  has_many :magic_items, dependent: :destroy

  translates :name

  validates :name, presence: true
end
