ActiveAdmin.register ExtraItem do
  menu priority: 7

  permit_params :extra_item_category_id, :name, :value_points

  config.sort_order = 'name_asc'

  controller do
    def create
      create! { new_admin_extra_item_url }
    end
  end

  action_item :new, only: :show do
    link_to 'New Extra Item', new_admin_extra_item_path
  end

  filter :extra_item_category
  filter :name
  filter :value_points

  index do
    selectable_column
    id_column
    column :extra_item_category, sortable: :extra_item_category_id
    column :name
    column :value_points
    actions
  end

  form do |f|
    f.inputs do
      f.input :extra_item_category, collection: ExtraItemCategory.includes(:army).order(:name).collect { |ei| [ei.army.name + ' - ' + ei.name, ei.id] }
      f.input :name
      f.input :value_points
    end
    f.actions
  end
end
