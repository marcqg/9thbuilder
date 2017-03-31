class UnitCategory < ApplicationRecord
  has_many :units, dependent: :destroy

  translates :name

  validates :name, presence: true
end
