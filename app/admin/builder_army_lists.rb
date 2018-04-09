ActiveAdmin.register Builder::ArmyList do
  menu parent: 'Ninth Age Builder', priority: 1, :if => proc{ current_user.has_role? :administrator }

  permit_params :uuid, :name

  filter :name
  filter :army, as: :select, collection: -> { NinthAge::Army.includes(:translations).includes(version: [:translations]).map { |army| [ army.name + ' ' + army.version.name, army.id ] } }
  filter :army_organisation, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:q_army_id/army_organisations', 'data-option-observed' => 'q_army_id'}, :collection => []

  controller do
    before_action :administrator_filter

    def administrator_filter
      raise ActionController::RoutingError.new('Not Found') unless current_user.has_role? :administrator
    end

    def scoped_collection
      end_of_association_chain.includes(army: [:translations]).includes(army_organisation: [:translations])
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
