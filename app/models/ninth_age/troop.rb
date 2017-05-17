class NinthAge::Troop < ApplicationRecord
  belongs_to :troop_type
  belongs_to :unit
  belongs_to :unit_option
  has_many :equipment_unit_troops, -> { order :position }, dependent: :destroy
  has_many :special_rule_unit_troops, -> { order :position }, dependent: :destroy

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  validates :unit_id, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }

  acts_as_list scope: :unit

  attr_accessor :army_filter

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end
end
