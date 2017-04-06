class NinthAge::Organisation < ApplicationRecord
  # default_scope { includes(:translations) }

  belongs_to :army

  has_many :organisation_groups

  has_many :army_lists

  has_many :default_organisations, foreign_key: :default_organisation_id, class_name: "NinthAge::OrganisationChange"
  #has_many :defaults, through: :default_organisations, source: :default_organisation

  has_many :new_organisations, foreign_key: :new_organisation_id, class_name: "NinthAge::OrganisationChange"
  #has_many :news, through: :new_organisations, source: :new_organisation

  translates :name
  globalize_accessors

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end