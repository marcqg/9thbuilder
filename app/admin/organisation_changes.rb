ActiveAdmin.register NinthAge::OrganisationChange do
  menu parent: 'Ninth Age Army', priority: 6

  permit_params :default_organisation_id, :new_organisation_id, :unit_id, :type_target

  filter :default_organisation
  filter :new_organisation
  filter :unit
end
