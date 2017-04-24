class NinthAge::ArmyOrganisation < ApplicationRecord
  # default_scope { includes(:translations) }

  belongs_to :army
  has_many :organisation_groups
  has_many :organisations, through: :organisation_groups

  translates :name, :description
  globalize_accessors

  validates :army_id, :name, presence: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  def as_json(options={})
    super(:include => [{organisation_groups: {include: {organisation: {}}}}])
  end
end