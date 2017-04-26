class NinthAge::EquipmentUnitTroop < ApplicationRecord

  belongs_to :equipment
  belongs_to :unit
  belongs_to :troop

  validates :position, presence: true
end
