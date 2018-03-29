ActiveAdmin.register Builder::ArmyList do
  menu parent: 'Ninth Age Builder', priority: 1, :if => proc{ current_user.has_role? :administrator }

  permit_params :uuid, :name

  config.sort_order = 'name_asc'

  filter :name
  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).map { |army| [ army.name + ' ' + army.version.name, army.id ] } }
  filter :army_organisation

  controller do
    before_filter :administrator_filter

    def administrator_filter
      raise ActionController::RoutingError.new('Not Found') unless current_user.has_role? :administrator
    end
  end

  index do
    id_column
    column :army, sortable: :army_id
    column :army_organisation, sortable: :army_organisation_id
    column :user, sortable: :user_id
    column :name
    column :value_points
    column :notes
    column :uuid
  end
end
