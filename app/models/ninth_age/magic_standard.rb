class NinthAge::MagicStandard < ApplicationRecord
  belongs_to :army
  has_many :army_list_unit_magic_standards, dependent: :destroy
  has_many :army_list_units, through: :army_list_unit_magic_standards
  has_one :override, class_name: 'MagicStandard', foreign_key: 'override_id'

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  validates :value_points, numericality: { greater_than_or_equal_to: 0 }

  scope :available_for, lambda { |army, value_points_limit|
    if value_points_limit.nil?
      includes(:translations).where('army_id = :army_id OR (army_id IS NULL AND ninth_age_magic_standards.id NOT IN (SELECT override_id FROM ninth_age_magic_standards WHERE army_id = :army_id AND override_id IS NOT NULL))', army_id: army).order('value_points DESC', 'ninth_age_magic_standard_translations.name')
    else
      includes(:translations).where('army_id = :army_id OR (army_id IS NULL AND ninth_age_magic_standards.id NOT IN (SELECT override_id FROM ninth_age_magic_standards WHERE army_id = :army_id AND override_id IS NOT NULL))', army_id: army).where('value_points <= ?', value_points_limit).order('value_points DESC', 'ninth_age_magic_standard_translations.name')
    end
  }
end
