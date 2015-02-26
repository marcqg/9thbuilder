ActiveAdmin.register MagicStandard do
  menu :parent => 'Magic Items', :priority => 1

  permit_params :army_id, :override_id, :name, :value_points

  config.sort_order = 'name_asc'

  controller do
    def create
      create! { new_admin_magic_standard_url }
    end
  end

  action_item :new, :only => :show do
    link_to 'New Magic Standard', new_admin_magic_standard_url
  end

  filter :army
  filter :name
  filter :value_points

  index do
    selectable_column
    id_column
    column :army, :sortable => :army_id
    column :name
    column :value_points
    actions
  end

  form do |f|
    f.inputs do
      f.input :army, :collection => Army.order(:name)
      f.input :override, :collection => MagicStandard.where(:army_id => nil).order(:name)
      f.input :name
      f.input :value_points
    end
    f.actions
  end
end
