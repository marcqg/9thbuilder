class NinthAge::ArmyOrganisation < ApplicationRecord
  # default_scope { includes(:translations) }

  belongs_to :army, class_name: "NinthAge::Army"
  has_many :organisation_groups
  has_many :organisations, through: :organisation_groups

  translates :name, :description
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  validates :army_id, presence: true

  def as_json(options={})
    super(:include => [{organisation_groups: {include: {organisation: {}}}}])
  end
end