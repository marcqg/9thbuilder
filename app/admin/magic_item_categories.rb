ActiveAdmin.register NinthAge::MagicItemCategory do
  menu parent: 'Ninth Age Magic Items'

  permit_params :name

  config.sort_order = 'name_asc'

  filter :name
end
