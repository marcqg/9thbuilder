class TroopType < ApplicationRecord
  has_many :troops, dependent: :destroy

  validates :name, presence: true
end
