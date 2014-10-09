ActiveAdmin.register MagicItem do
  menu :priority => 8

  permit_params :army_id, :magic_item_category_id, :override_id, :name, :value_points, :is_multiple

  config.sort_order = 'name_asc'

  controller do
    def create
      create! { new_admin_magic_item_url }
    end
  end

  action_item :only => :show do
    link_to 'New Magic Item', new_admin_magic_item_path
  end

  filter :army
  filter :magic_item_category
  filter :name
  filter :value_points
  filter :is_multiple

  index do
    selectable_column
    id_column
    column :army, :sortable => :army_id
    column :magic_item_category, :sortable => :magic_item_category_id
    column :name
    column :value_points
    column :is_multiple
    actions
  end

  form do |f|
    f.inputs do
      f.input :army, :collection => Army.order(:name)
      f.input :magic_item_category, :collection => MagicItemCategory.order(:name)
      f.input :override, :collection => MagicItem.where(:army_id => nil).order(:name)
      f.input :name
      f.input :value_points
      f.input :is_multiple
    end
    f.actions
  end
end
