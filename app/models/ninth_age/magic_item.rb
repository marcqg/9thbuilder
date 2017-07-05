class NinthAge::MagicItem < ApplicationRecord

  belongs_to :version

  belongs_to :army
  belongs_to :magic_item_category
  has_many :army_list_unit_magic_items, dependent: :destroy
  has_many :army_list_units, through: :army_list_unit_magic_items
  has_one :override, class_name: 'NinthAge::MagicItem', foreign_key: 'override_id'

  translates :name, :description
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  validates :version_id, :magic_item_category_id, :value_points, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0 }

  def name_with_version
    "#{name} - #{version.name}"
  end

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  scope :available_for, lambda { |army, value_points_limit|
    if value_points_limit.nil?
      includes(:translations).where('army_id = :army_id OR (army_id IS NULL AND ninth_age_magic_items.id NOT IN (SELECT override_id FROM ninth_age_magic_items WHERE army_id = :army_id AND override_id IS NOT NULL))', army_id: army)
          .order('value_points DESC', 'ninth_age_magic_item_translations.name')
    else
      includes(:translations).where('army_id = :army_id OR (army_id IS NULL AND ninth_age_magic_items.id NOT IN (SELECT override_id FROM ninth_age_magic_items WHERE army_id = :army_id AND override_id IS NOT NULL))', army_id: army)
          .where('value_points <= ?', value_points_limit)
          .order('value_points DESC', 'ninth_age_magic_item_translations.name')
    end
  }
end
