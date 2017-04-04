class Troop < ApplicationRecord
  belongs_to :troop_type
  belongs_to :unit
  belongs_to :unit_option
  has_many :equipments, dependent: :nullify
  has_many :special_rules, dependent: :nullify

  translates :name

  validates :unit_id, :name, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }

  acts_as_list scope: :unit

  attr_accessor :army_filter

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end
end
