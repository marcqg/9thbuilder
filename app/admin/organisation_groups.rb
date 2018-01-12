ActiveAdmin.register NinthAge::OrganisationGroup do
  menu parent: 'Ninth Age Army', priority: 4

  permit_params :army_organisation_id, :organisation_id, :type_target, :target

  filter :army_organisation
  filter :organisation
end
