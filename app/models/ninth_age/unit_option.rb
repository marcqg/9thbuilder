class NinthAge::UnitOption < ApplicationRecord
  belongs_to :unit
  belongs_to :parent, class_name: 'NinthAge::UnitOption'
  belongs_to :mount, class_name: 'NinthAge::Unit'
  has_many :children, -> { order 'position' }, class_name: 'NinthAge::UnitOption', foreign_key: 'parent_id', dependent: :nullify
  has_one :troop, dependent: :nullify
  has_many :army_list_unit_unit_options, dependent: :destroy
  has_many :army_list_units, through: :army_list_unit_unit_options

  translates :name, :description, :name_upgrade
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  validates :unit_id, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :position, numericality: { greater_than_or_equal_to: 1, only_integer: true, allow_nil: true }
  validates :is_per_model, inclusion: { in: [true, false] }
  validates :is_multiple, inclusion: { in: [true, false] }
  validates :is_magic_items, inclusion: { in: [true, false] }
  validates :is_magic_standards, inclusion: { in: [true, false] }
  validates :is_extra_items, inclusion: { in: [true, false] }
  validates :is_unique_choice, inclusion: { in: [true, false] }
  validates :is_required, inclusion: { in: [true, false] }
  validates :is_magic, inclusion: { in: [true, false] }

  acts_as_list scope: 'unit_id = #{unit_id} AND COALESCE(parent_id, \'\') = \'#{parent_id}\''

  scope :without_parent, -> { where(parent_id: nil) }
  scope :exclude_magics_and_extra, -> { where(is_magic_items: false, is_magic_standards: false, is_extra_items: false) }
  scope :only_magic_items, -> { where(is_magic_items: true, is_magic_standards: false) }
  scope :only_magic_standards, -> { where(is_magic_items: false, is_magic_standards: true, is_extra_items: false) }
  scope :only_extra_items, -> { where(is_magic_items: false, is_magic_standards: false, is_extra_items: true) }
  scope :only_mounts, -> { where('mount_id IS NOT NULL') }

  attr_accessor :army_filter

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end
end
