class NinthAge::OrganisationChange < ApplicationRecord
  belongs_to :default_organisation, foreign_key: "default_organisation_id", class_name: "NinthAge::Organisation"
  belongs_to :new_organisation, foreign_key: "new_organisation_id", class_name: "NinthAge::Organisation"

  enum type_target: { Min: 0, Max: 1 }
end