ActiveAdmin.register Paint::PaintList do
  menu parent: 'Paint list', priority: 15, :if => proc{ current_user.has_role? :administrator }

  controller do
    before_filter :administrator_filter

    def administrator_filter
      raise ActionController::RoutingError.new('Not Found') unless current_user.has_role? :administrator
    end
  end

  permit_params :name

  config.sort_order = 'name_asc'

  filter :name
  filter :army

  index do
    id_column
    column :user
    column :name
  end
end
