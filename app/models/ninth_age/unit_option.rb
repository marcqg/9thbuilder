class NinthAge::UnitOption < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes
  
  belongs_to :unit, class_name: "NinthAge::Unit"
  delegate :army, :to => :unit, :allow_nil => true

  belongs_to :parent, class_name: 'NinthAge::UnitOption'
  has_many :children, -> { order 'position' }, class_name: 'NinthAge::UnitOption', foreign_key: 'parent_id', dependent: :nullify
  belongs_to :unit_option_activator, class_name: 'NinthAge::UnitOption'
  has_many :unit_option_activated, -> { order 'position' }, class_name: 'NinthAge::UnitOption', foreign_key: 'unit_option_activator_id', dependent: :nullify
  belongs_to :unit_link, class_name: 'NinthAge::Unit'
  belongs_to :mount, class_name: 'NinthAge::Unit'
  belongs_to :domain_magic, class_name: "NinthAge::DomainMagic"
  belongs_to :organisation, class_name: "NinthAge::Organisation"
  belongs_to :extra_item, class_name: "NinthAge::ExtraItem"
  has_many :army_list_unit_unit_options, dependent: :destroy, class_name: 'Builder::ArmyListUnitUnitOption'
  has_many :army_list_units, through: :army_list_unit_unit_options, class_name: 'Builder::ArmyListUnit'

  enum category: { NoUse: 0, General: 1, BSB: 2, Marks: 3, Spells: 4, Mount: 5, Equipment: 6, MagicEquipment: 7, MagicOrLine: 8, MagicPath: 9, M: 10, S: 11, C: 12, MagicBanner: 13 }

  translates :name, :description, :infos, :name_upgrade
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  validates :unit_id, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0, allow_nil: true }
  validates :position, numericality: { greater_than: 0, only_integer: true, allow_nil: false }
  validates :is_per_model, inclusion: { in: [true, false] }
  validates :is_multiple, inclusion: { in: [true, false] }
  validates :is_magic_items, inclusion: { in: [true, false] }
  validates :is_magic_standards, inclusion: { in: [true, false] }
  validates :is_extra_items, inclusion: { in: [true, false] }
  validates :is_unique_choice, inclusion: { in: [true, false] }
  validates :is_required, inclusion: { in: [true, false] }
  validates :is_magic, inclusion: { in: [true, false] }
  validates :domain_magic, presence: true, if: ->(unit_option){unit_option.is_magic?}
  validates :banner_limit, numericality: { greater_than_or_equal_to: 0, allow_nil: false }, if: ->(unit_option){unit_option.is_magic_standards?}

  acts_as_list scope: 'unit_id = #{unit_id} AND COALESCE(parent_id, \'\') = \'#{parent_id}\''

  scope :without_parent, -> { where(parent_id: nil) }
  #scope :exclude_magics_and_extra, -> { where(is_magic_items: false, is_magic_standards: false, is_extra_items: false) }
  scope :exclude_magics_and_extra, -> { where(is_magic_standards: false) }
  scope :only_magic_items, -> { where(is_magic_items: true, is_magic_standards: false) }
  scope :only_magic_standards, -> { where(is_magic_items: false, is_magic_standards: true, is_extra_items: false) }
  scope :only_extra_items, -> { where(is_magic_items: false, is_magic_standards: false, is_extra_items: true) }
  scope :only_mounts, -> { where('mount_id IS NOT NULL') }

  attr_accessor :army_filter

  def is_magics_or_extra
    return is_magic_items || (is_magic_standards && value_points < 1) || is_extra_items
  end

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end
end
