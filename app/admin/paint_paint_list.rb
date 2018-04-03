ActiveAdmin.register Paint::PaintList do
  menu parent: 'Paint list', priority: 15, :if => proc{ current_user.has_role? :administrator }

  permit_params :name

  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).includes(version: [:translations]).map { |army| [ army.name + ' ' + army.version.name, army.id ] } } 
  filter :name

  controller do
    before_action :administrator_filter

    def administrator_filter
      raise ActionController::RoutingError.new('Not Found') unless current_user.has_role? :administrator
    end
  end

  index do
    id_column
    column :user, sortable: :user_id
    column :name
  end
end
