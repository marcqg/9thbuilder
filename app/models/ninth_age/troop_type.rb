class NinthAge::TroopType < ApplicationRecord
  has_many :troops, dependent: :destroy

  translates :name
  globalize_accessors

  validates :name, presence: true
end
