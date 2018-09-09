class NinthAge::MagicStandard < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :version, class_name: "NinthAge::Version"
  belongs_to :army, class_name: "NinthAge::Army"

  belongs_to :organisation, foreign_key: :organisation_id, class_name: "NinthAge::Organisation"
  has_and_belongs_to_many :organisations, dependent: :destroy, class_name: "NinthAge::Organisation"

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

  scope :available_for, lambda { |army, version, value_points_limit, organisations|

    banners =  includes(:translations)
                .where('(army_id = :army_id OR army_id IS NULL) AND ninth_age_magic_standards.id NOT IN (SELECT override_id FROM ninth_age_magic_standards WHERE army_id = :army_id AND override_id IS NOT NULL)', army_id: army)
                .where(:version_id => version)
    
    unless value_points_limit.nil?
      banners = banners.where('value_points <= ?', value_points_limit)
    end

    unless organisations.nil?
      banners = banners.includes(:organisations)
                        .where.not(organisations: organisations)
    end

    banners.order('value_points DESC', 'ninth_age_magic_standard_translations.name')
  }

  def display_type_figurine
    I18n.t("magic_item.type_figurine.#{type_figurine}", default: type_figurine.titleize)
  end

  scope :ordered, -> { order("ninth_age_magic_standard_translations.name ASC") }

  ransacker :army_null, formatter: proc {|value|
    results = NinthAge::MagicStandard.where(:army_id => nil).map(&:id) if value == "true"
    results = NinthAge::MagicStandard.all.map(&:id) if value == "false"
    results.present? ? results : nil
  } do |parent|
    parent.table[:id]
  end

  ransacker :search_label, formatter: proc {|value|
    results = NinthAge::MagicStandard.with_translations.where("ninth_age_magic_standard_translations.name LIKE ?", "%#{value}%").map(&:id)
    p '--------------'
    p results
    results.present? ? results : nil
  } do |parent|
    parent.table[:id]
  end
end
