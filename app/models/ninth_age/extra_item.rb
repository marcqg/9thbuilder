class NinthAge::ExtraItem < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :extra_item_category, class_name: "NinthAge::ExtraItemCategory"
  belongs_to :extra_item_activator, foreign_key: 'extra_item_activator_id', dependent: :destroy, class_name: 'NinthAge::ExtraItem'

  has_many :army_list_unit_extra_items, dependent: :destroy, class_name: 'Builder::ArmyListUnitExtraItem'
  has_many :army_list_units, through: :army_list_unit_extra_items, class_name: 'Builder::ArmyListUnit'

  translates :name, :description, :infos
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  validates :extra_item_category_id, :value_points, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0 }

  def name_with_version
    "#{name} - #{version.name}"
  end

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  scope :ordered, -> { order("ninth_age_extra_item_translations.name ASC") }

  scope :available_for, lambda { |extra_item_category, value_points_limit|
    if value_points_limit.nil?
      includes(:translations)
      .with_locales(I18n.available_locales)
      .where(extra_item_category_id: extra_item_category)
      .order('value_points DESC', 'ninth_age_extra_item_translations.name')
    else
      includes(:translations)
      .with_locales(I18n.available_locales)
      .where(extra_item_category_id: extra_item_category)
      .where('value_points <= ?', value_points_limit)
      .order('value_points DESC', 'ninth_age_extra_item_translations.name')
    end
  }
end
