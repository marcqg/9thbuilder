class TroopType < ApplicationRecord
  has_many :troops, dependent: :destroy

  translates :name

  validates :name, presence: true
end
