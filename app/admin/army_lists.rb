ActiveAdmin.register Builder::ArmyList do
  menu parent: 'Ninth Age Builder', priority: 1, :if => proc{ current_user.has_role? :administrator }

  controller do
    before_filter :administrator_filter

    def administrator_filter
      raise ActionController::RoutingError.new('Not Found') unless current_user.has_role? :administrator
    end
  end

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
