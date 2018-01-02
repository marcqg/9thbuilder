class NinthAge::EquipmentUnitTroop < ApplicationRecord

  belongs_to :equipment, class_name: "NinthAge::Equipment"
  belongs_to :unit, class_name: "NinthAge::Unit"
  delegate :army, :to => :unit, :allow_nil => true
  delegate :version, :to => :army, :allow_nil => true
  belongs_to :troop, class_name: "NinthAge::Troop"

  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }

  acts_as_list scope: :unit

  attr_accessor :army_filter
  attr_accessor :version_filter

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end

  def version_filter
    @version_filter ||= unit.try(:army).try(:version).try(:id)
    @version_filter ||= unit.try(:special_rule).try(:version).try(:id)
  end
end
