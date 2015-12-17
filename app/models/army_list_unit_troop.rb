class ArmyListUnitTroop < ActiveRecord::Base
  belongs_to :troop
  belongs_to :army_list_unit

  validates :troop_id, :army_list_unit, presence: true
  validates :size, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }

  acts_as_list scope: :army_list_unit
end
