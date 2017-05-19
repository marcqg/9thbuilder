ActiveAdmin.register Builder::ArmyList do
  menu parent: 'Ninth Age Builder', priority: 1

  permit_params :uuid, :name

  config.sort_order = 'name_asc'

  filter :name
  filter :army
  filter :army_organisation

  index do
    id_column
    column :army
    column :army_organisation
    column :user
    column :name
    column :value_points
    column :notes
    column :uuid
  end
end
