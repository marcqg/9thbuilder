class UnitCategory < ApplicationRecord
  has_many :units, dependent: :destroy

  validates :name, presence: true
end
