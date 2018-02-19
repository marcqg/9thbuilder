class NinthAge::MagicStandard < ApplicationRecord

  belongs_to :version, class_name: "NinthAge::Version"
  belongs_to :army, class_name: "NinthAge::Army"
  belongs_to :organisation, class_name: "NinthAge::Organisation"

  has_many :army_list_unit_magic_standards, dependent: :destroy, class_name: 'Builder::ArmyListUnitMagicStandard'
  has_many :army_list_units, through: :army_list_unit_magic_standards, class_name: 'Builder::ArmyListUnit'
  has_one :override, class_name: 'MagicStandard', foreign_key: 'override_id'

  translates :name, :description, :infos
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true
  
  enum type_figurine: { All: 0, Infantry: 1, Monster: 2, NoLargeTarget: 3, AnimisteBestial: 4, MountedCharacter: 5 , Character: 6, ModelsOnFoot: 7 }

  validates :value_points, numericality: { greater_than_or_equal_to: 0 }
  validates :max, numericality: { greater_than_or_equal_to: 0 }
  validates :type_figurine, presence: true

  def name_with_version
    "#{name} - #{version.name}"
  end

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  scope :available_for, lambda { |army, version, value_points_limit|
    if value_points_limit.nil?
      includes(:translations).where('(army_id = :army_id OR army_id IS NULL) AND ninth_age_magic_standards.id NOT IN (SELECT override_id FROM ninth_age_magic_standards WHERE army_id = :army_id AND override_id IS NOT NULL)', army_id: army)
          .where(:version_id => version)
          .order('value_points DESC', 'ninth_age_magic_standard_translations.name')
    else
      includes(:translations).where('(army_id = :army_id OR army_id IS NULL) AND ninth_age_magic_standards.id NOT IN (SELECT override_id FROM ninth_age_magic_standards WHERE army_id = :army_id AND override_id IS NOT NULL)', army_id: army)
          .where(:version_id => version)
          .where('value_points <= ?', value_points_limit)
          .order('value_points DESC', 'ninth_age_magic_standard_translations.name')
    end
  }

  def display_type_figurine
    I18n.t("magic_item.type_figurine.#{type_figurine}", default: type_figurine.titleize)
  end
end
