ActiveAdmin.register Tournament::ArmyListApply do
  menu parent: proc { I18n.t('active_admin.tournament') }, priority: 2, :if => proc{ current_user.has_role? :administrator }

  config.filters = false

  index do
    selectable_column
    id_column
    column :event
    column :army_list
    actions
  end
 end