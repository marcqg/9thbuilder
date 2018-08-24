ActiveAdmin.register Tournament::UserApply do
  menu parent: 'Tournament', priority: 2, :if => proc{ current_user.has_role? :administrator }

  permit_params :name, :email

  config.filters = false

  index do
    selectable_column
    id_column
    column :event
    column :user
    column :army
    column :army_list
    actions
  end
 end