class NinthAge::SpecialRuleUnitTroop < ApplicationRecord

  belongs_to :special_rule
  belongs_to :unit
  belongs_to :troop

  validates :position, presence: true
end
