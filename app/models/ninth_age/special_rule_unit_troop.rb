class NinthAge::SpecialRuleUnitTroop < ApplicationRecord

  belongs_to :special_rule, class_name: "NinthAge::SpecialRule"
  belongs_to :unit, class_name: "NinthAge::Unit"
  delegate :army, :to => :unit, :allow_nil => true
  belongs_to :troop, class_name: "NinthAge::Troop"

  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }

  acts_as_list scope: :unit

  attr_accessor :army_filter

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end
end
