ActiveAdmin.register NinthAge::UnitOption do
  menu parent: 'Units'

  permit_params :unit_id, :parent_id, :mount_id, :name, :value_points, :position, :is_per_model, :is_multiple, :is_magic_items, :is_magic_standards, :is_extra_items, :is_unique_choice

  controller do
    def create
      create! { new_admin_unit_option_url }
    end
  end

  member_action :move_higher, method: :post do
    resource.move_higher
    resource.save

    redirect_to admin_unit_url(resource.unit)
  end

  member_action :move_lower, method: :post do
    resource.move_lower
    resource.save

    redirect_to admin_unit_url(resource.unit)
  end

  action_item :new, only: :show do
    link_to 'New Unit Option', new_admin_unit_option_path('unit_option[unit_id]' => unit_option.unit)
  end

  filter :unit, collection: proc { NinthAge::Unit.includes(:army).order('armies.name', 'ninth_age_units.name').collect { |r| [r.army.name + ' - ' + r.name, r.id] } }
  # filter :parent, :collection => proc { UnitOption.includes(:unit).without_parent.collect { |r| [r.unit.name + ' - ' + r.name, r.id] } }
  filter :name
  filter :value_points

  index do
    selectable_column
    id_column
    column :unit, sortable: :unit_id
    column :mount, sortable: :mount_id
    column :name
    column :value_points
    column :is_per_model
    column :is_multiple
    column :is_magic_items
    column :is_magic_standards
    column :is_extra_items
    column :is_unique_choice
    # column :position
    actions
  end

  form do |f|
    f.inputs do
      f.input :army_filter, as: :select, collection: NinthAge::Army.order(:name), disabled: NinthAge::Army.disabled.pluck(:id), label: 'Army FILTER'
      f.input :unit, collection: NinthAge::Unit.includes(:army).order('ninth_age_armies.name', 'ninth_age_units.name').collect { |u| [u.army.name + ' - ' + u.name, u.id] }
      f.input :parent, collection: NinthAge::UnitOption.includes(unit: [:army]).order('ninth_age_armies.name', 'ninth_age_units.name', 'ninth_age_unit_options.position').collect { |uo| [uo.unit.army.name + ' - ' + uo.unit.name + ' - ' + uo.name, uo.id] }
      f.input :mount, collection: NinthAge::Unit.includes(:army).mount_category.order('ninth_age_armies.name', 'ninth_age_units.name').collect { |u| [u.army.name + ' - ' + u.name, u.id] }
      f.input :name
      f.input :value_points
      f.input :position
      f.input :is_per_model
      f.input :is_multiple
      f.input :is_magic_items
      f.input :is_magic_standards
      f.input :is_extra_items
      f.input :is_unique_choice
    end
    f.actions
  end
end
