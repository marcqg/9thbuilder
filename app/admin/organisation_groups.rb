ActiveAdmin.register NinthAge::OrganisationGroup do
  menu parent: 'Ninth Age Organisations', priority: 2

  permit_params :army_organisation_id, :organisation_id

  filter :army_organisation
  filter :organisation
end
