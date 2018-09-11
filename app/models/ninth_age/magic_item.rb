class NinthAge::MagicItem < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :version, class_name: "NinthAge::Version"

  belongs_to :army, class_name: "NinthAge::Army"
  belongs_to :magic_item_category, class_name: "NinthAge::MagicItemCategory"
  has_many :army_list_unit_magic_items, dependent: :destroy, :class_name => 'Builder::ArmyListUnitMagicItem'
  has_many :army_list_units, through: :army_list_unit_magic_items, :class_name => 'Builder::ArmyListUnit'
  has_one :override, class_name: 'NinthAge::MagicItem', foreign_key: 'override_id'

  translates :name, :description, :infos
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  enum type_figurine: { All: 0, Infantry: 1, Monster: 2, NoLargeTarget: 3, AnimisteBestial: 4, MountedCharacter: 5 , Character: 6, ModelsOnFoot: 7, MageOnFoot: 8, Goblins: 9, FeralOrc: 10, MonarchsOfTheDead:11, ModelsOnChariots: 12  }
  bitmask :type_target, :as => [:Hex, :Hex_r, :Missile, :Damage, :Augment, :Augment_b, :Focused, :Direct, :Ground, :Universal, :Universal_g], :null => false
  bitmask :type_duration, :as => [:OneTurn, :Instant, :Permanent, :RemainsInPlay], :null => false

  validates :version_id, :magic_item_category_id, :value_points, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :disable_magic_path_limit, inclusion: { in: [true, false] }

  def name_with_version
    "#{name} - #{version.name}"
  end

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  scope :ordered, -> { order("ninth_age_magic_item_translations.name ASC") }

  scope :available_for, lambda { |army, version, value_points_limit|

    magic_items = includes(:translations)
                  .order('value_points DESC', 'ninth_age_magic_item_translations.name')

    magic_items = 
      if army.has_default_magic_items 
        magic_items.where('(army_id = :army_id OR (army_id IS NULL AND ninth_age_magic_items.id NOT IN (SELECT override_id FROM ninth_age_magic_items WHERE army_id = :army_id AND override_id IS NOT NULL))) AND version_id = :version_id', army_id: army, version_id: version)
      else
        magic_items.where({army_id: army, version_id: version})
      end

    unless value_points_limit.nil?
      magic_items = magic_items.where('value_points <= ?', value_points_limit)
    end

    return magic_items
  }

  def display_type_target
    names = []
    type_target.each do |tt|
      names << I18n.t("magic_item.type_target.#{tt}", default: tt).to_highlight
    end
    names.join(', ').html_safe
  end

  def display_type_figurine
    I18n.t("magic_item.type_figurine.#{type_figurine}", default: type_figurine.titleize)
  end

  def display_type_duration
    names = []
    type_duration.each do |tt|
      names << I18n.t("magic_item.type_duration.#{tt}", default: tt).to_highlight
    end
    names.join(', ').html_safe
  end 

  ransacker :army_null, formatter: proc {|value|
    results = NinthAge::MagicItem.where(:army_id => nil).map(&:id) if value == "true"
    results = NinthAge::MagicItem.all.map(&:id) if value == "false"
    results.present? ? results : nil
  } do |parent|
    parent.table[:id]
  end 
end
