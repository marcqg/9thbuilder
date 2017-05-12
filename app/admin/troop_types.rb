ActiveAdmin.register NinthAge::TroopType do
  menu parent: 'Ninth Age Troops'

  permit_params :name

  config.sort_order = 'name_asc'

  filter :name
end
