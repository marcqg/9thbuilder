ActiveAdmin.register Army do
  menu :priority => 2

  permit_params :name

  config.sort_order = 'name_asc'

  filter :name
end
