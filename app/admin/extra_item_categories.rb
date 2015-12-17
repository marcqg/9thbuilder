ActiveAdmin.register ExtraItemCategory do
  menu parent: 'Extra Items'

  permit_params :army_id, :name

  config.sort_order = 'name_asc'

  filter :army
  filter :name
end
