class NinthAge::SpecialRule < ApplicationRecord
  has_and_belongs_to_many :unit
  has_and_belongs_to_many :troop

  translates :name, :description
  globalize_accessors

  validates :unit_id, :name, :description, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }

  acts_as_list scope: :unit

  attr_accessor :army_filter

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end
end
