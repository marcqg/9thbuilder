class NinthAge::ArmyOrganisation < ApplicationRecord
  nilify_blanks :types => [:text, :string]

  belongs_to :army, class_name: "NinthAge::Army"
  has_many :organisation_groups, class_name: "NinthAge::OrganisationGroup"
  has_many :organisations, through: :organisation_groups, class_name: "NinthAge::Organisation"

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