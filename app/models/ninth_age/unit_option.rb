class NinthAge::UnitOption < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes
  
  belongs_to :unit, class_name: "NinthAge::Unit"
  delegate :army, :to => :unit, :allow_nil => true

  belongs_to :parent, class_name: 'NinthAge::UnitOption'
  has_many :children, -> { order :position }, class_name: 'NinthAge::UnitOption', foreign_key: 'parent_id', dependent: :nullify
  belongs_to :unit_option_activator, class_name: 'NinthAge::UnitOption'
  has_many :unit_option_activated, -> { order 'position' }, class_name: 'NinthAge::UnitOption', foreign_key: 'unit_option_activator_id', dependent: :nullify
  belongs_to :unit_link, class_name: 'NinthAge::Unit'
  belongs_to :mount, class_name: 'NinthAge::Unit'
  belongs_to :domain_magic, class_name: "NinthAge::DomainMagic"
  belongs_to :organisation, class_name: "NinthAge::Organisation"
  belongs_to :extra_item, class_name: "NinthAge::ExtraItem"
  has_many :army_list_unit_unit_options, dependent: :destroy, class_name: 'Builder::ArmyListUnitUnitOption'
  has_many :army_list_units, through: :army_list_unit_unit_options, class_name: 'Builder::ArmyListUnit'
  
  has_and_belongs_to_many :extra_item_categories, class_name: "NinthAge::ExtraItemCategory"

  enum category: { Generic: 0, General: 1, BSB: 2, ArmyAttribut: 3, ExtraSpells: 4, Mount: 5, Equipment: 6, MagicEquipment: 7, MagicLvl: 8, MagicPath: 9, M: 10, S: 11, C: 12, MagicBanner: 13 }

  translates :name, :description, :infos
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  validates :unit_id, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: -1, allow_nil: true }
  validates :position, numericality: { greater_than: 0, only_integer: true, allow_nil: false }
  validates :magic_item_factor, numericality: { greater_than: 0, only_integer: true, allow_nil: false }
  validates :is_per_model, inclusion: { in: [true, false] }
  validates :is_multiple, inclusion: { in: [true, false] }
  validates :is_unique_choice, inclusion: { in: [true, false] }
  validates :is_required, inclusion: { in: [true, false] }
  validates :mount_and_carac_points, inclusion: { in: [true, false] }
  validates :mount, presence: true, if: ->(unit_option){unit_option.Mount?}
  validates :domain_magic, presence: true, if: ->(unit_option){unit_option.MagicPath?}
  validates :banner_limit, numericality: { greater_than_or_equal_to: 0, allow_nil: false }, if: ->(unit_option){unit_option.BSB? || unit_option.MagicBanner?}

  acts_as_list scope: 'unit_id = #{unit_id} AND COALESCE(parent_id, \'\') = \'#{parent_id}\''

  scope :only_parents, -> { where(parent_id: nil).where.not(:category => [:ExtraSpells, :MagicLvl, :MagicPath, :Mount, :M, :S, :C]) }
  scope :only_magics, -> { where(parent_id: nil).where(:category => [:ExtraSpells, :MagicLvl, :MagicPath]) }
  scope :without_parent, -> { where(parent_id: nil) }
  scope :exclude_magics_and_extra, -> { where.not(:category => [:ArmyAttribut]) }
  scope :only_magic_items, -> { where(:category => [:MagicEquipment]) }
  scope :only_magic_standards, -> { where(:category => [:MagicBanner, :BSB]) }
  scope :only_extra_items, -> { where(:category => [:ArmyAttribut]) }
  scope :only_command_groups, -> { where(:category => [:M, :S, :C]) }
  scope :only_mounts, -> { where(:category => :Mount) }
  scope :only_magic_lvls, -> { where(:category => :MagicLvl) }
  scope :only_paths, -> { where(:category => :MagicPath) }

  attr_accessor :army_filter

  def is_magics_or_extra
    return self.MagicEquipment? || (self.MagicBanner? && value_points < 1) || self.ArmyAttribut?
  end

  def army_filter
    @army_filter ||= unit.try(:army).try(:id)
  end

  def display_name 
    return case self.category.to_sym
    when :General, :BSB, :M, :S, :C, :MagicBanner
      I18n.t("activerecord.attributes.ninth_age_unit_option.category.#{category}", default: category.titleize)
    when :MagicEquipment
      if name.nil?
        I18n.t("activerecord.attributes.ninth_age_unit_option.category.#{category}", default: category.titleize)
      else 
        name
      end
    when :MagicPath
      unless self.domain_magic.nil?
        self.domain_magic.name
      else
        self.name
      end
    when :Mount
      unless self.mount.nil?
        self.mount.name
      else
        self.name
      end
    else
      self.name
    end
  end
  
end
