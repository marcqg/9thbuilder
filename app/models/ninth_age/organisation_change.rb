class NinthAge::OrganisationChange < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  
  belongs_to :default_organisation, foreign_key: 'default_organisation_id', class_name: 'NinthAge::Organisation'
  belongs_to :new_organisation, foreign_key: 'new_organisation_id', class_name: 'NinthAge::Organisation'

  belongs_to :unit, class_name: "NinthAge::Unit"
  delegate :army, :to => :unit, :allow_nil => true, :prefix => true

  enum type_target: { Min: 0, Max: 1 }

  validates :default_organisation_id, presence: true
  validates :new_organisation_id, presence: true
  validates :unit_id, presence: true
  validates :type_target, presence: true
  validates :number, presence: true
  validates :type_target, presence: true
end