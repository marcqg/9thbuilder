class MagicItemCategory < ApplicationRecord
  has_many :magic_items, dependent: :destroy

  validates :name, presence: true
end
