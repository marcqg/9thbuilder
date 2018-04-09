ActiveAdmin.register Tournament::Tournament do
  menu priority: 3, label: proc { I18n.t('active_admin.tournament') }, :if => proc{ current_user.has_role? :administrator }

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