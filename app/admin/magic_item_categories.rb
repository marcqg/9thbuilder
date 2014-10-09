ActiveAdmin.register MagicItemCategory do
  menu :parent => 'Magic Items'

  permit_params :name

  config.sort_order = 'name_asc'

  filter :name
end
