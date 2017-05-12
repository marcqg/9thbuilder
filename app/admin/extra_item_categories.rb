ActiveAdmin.register NinthAge::ExtraItemCategory do
  menu parent: 'Ninth Age Extra Items'

  permit_params :army_id, :name

  config.sort_order = 'name_asc'

  filter :army
  filter :name

  index do
    selectable_column
    id_column
    column :army, sortable: :army_id
    column :name
    actions
  end
end
