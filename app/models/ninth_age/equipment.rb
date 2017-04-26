class NinthAge::Equipment < ApplicationRecord
  has_many :equipment_unit_troops, dependent: :destroy

  translates :name, :description
  globalize_accessors

  validates :name, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }

  acts_as_list scope: :unit

  attr_accessor :army_filter

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end
end
