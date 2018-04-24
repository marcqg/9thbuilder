ActiveAdmin.register Tournament::Event do
  menu parent: 'Tournament', priority: 1, :if => proc{ current_user.has_role? :administrator }

  permit_params :name

  config.filters = false

  index do
    selectable_column
    id_column
    column :name
    column :creator
    actions
  end
 end