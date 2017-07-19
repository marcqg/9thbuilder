class NinthAge::OrganisationChange < ApplicationRecord
  belongs_to :default_organisation, foreign_key: 'default_organisation_id', class_name: 'NinthAge::Organisation'
  belongs_to :new_organisation, foreign_key: 'new_organisation_id', class_name: 'NinthAge::Organisation'

  belongs_to :unit

  enum type_target: { Min: 0, Max: 1 }

  validates :default_organisation_id, :new_organisation_id, :unit_id, :type_target, :number, presence: true
end