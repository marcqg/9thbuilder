ActiveAdmin.register NinthAge::UnitOption do
  menu parent: 'Ninth Age Army', priority: 10

  permit_params :unit_id, :parent_id, :mount_id, :value_points, :position, :is_per_model, :is_multiple, :is_magic, :is_upgratable, :domain_magic_id, :organisation_id, :value_points_upgrade, :upgrade_target, :max, :max_model, :min_model, :max_unit, :is_magic_items, :is_magic_standards, :is_extra_items, :is_unique_choice, :locale, translations_attributes: [:id, :name, :locale, :_destroy]

  controller do
    def create
      create! { new_admin_ninth_age_unit_option_url }
    end
  end

  before_action only: [:create, :update] do
    params[:ninth_age_unit_option][:translations_attributes].each do |k, v|
      if v.except('id', 'locale').all? { |_, v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_unit_option][:translations_attributes][k] = v
        v.each do |p|
          puts p
        end
      end
    end
  end

  member_action :move_higher, method: :post do
    resource.move_higher
    resource.save

    redirect_to admin_ninth_age_unit_url(resource.unit)
  end

  member_action :move_lower, method: :post do
    resource.move_lower
    resource.save

    redirect_to admin_ninth_age_unit_url(resource.unit)
  end

  action_item :new, only: :show do
    link_to 'New Unit Option', new_admin_ninth_age_unit_option_path('unit_option[unit_id]' => ninth_age_unit_option.unit)
  end

  filter :unit, collection: proc { NinthAge::Unit.includes(:army).collect { |r| [r.army.name + ' - ' + r.name, r.id] } }
  # filter :parent, :collection => proc { UnitOption.includes(:unit).without_parent.collect { |r| [r.unit.name + ' - ' + r.name, r.id] } }
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
      f.input :army_filter, as: :select, collection: NinthAge::Army.includes(:translations).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }, disabled: NinthAge::Army.disabled.pluck(:id)
      f.input :unit, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_option_army_filter/units', 'data-option-observed' => 'ninth_age_unit_option_army_filter'}, :collection => (resource.army ? resource.army.units.collect {|unit| [unit.name, unit.id]} : [])
      f.input :parent, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/unit-:ninth_age_unit_option_unit_id/unit_options', 'data-option-observed' => 'ninth_age_unit_option_unit_id'}, :collection => (resource.unit ? resource.unit.unit_options.collect {|unit_option| [unit_option.name, unit_option.id]} : [])
      f.input :mount, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_option_army_filter/units', 'data-option-observed' => 'ninth_age_unit_option_army_filter'}, :collection => (resource.army ? resource.army.units.collect {|unit| [unit.name, unit.id]} : [])
      f.input :value_points
      f.input :position
      f.input :is_per_model
      f.input :is_multiple
      f.input :is_required
      f.input :is_magic
      f.input :is_upgratable
      f.input :domain_magic, collection: NinthAge::DomainMagic.includes(:translations).collect { |u| [u.name + ' - ' + u.version.name, u.id] }
      f.input :organisation, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_option_army_filter/organisations', 'data-option-observed' => 'ninth_age_unit_option_army_filter'}, :collection => (resource.army ? resource.army.organisations.collect {|organisation| [organisation.name, organisation.id]} : [])
      f.input :value_points_upgrade
      f.input :upgrade_target
      f.input :max
      f.input :max_model
      f.input :min_model
      f.input :max_unit
      f.input :is_magic_items
      f.input :is_magic_standards
      f.input :is_extra_items
      f.input :is_unique_choice

      f.translate_inputs do |t|
        t.input :name
      end
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :army
      row :unit
      row :parent
      row :mount
      row :value_points
      row :position
      row :is_per_model
      row :is_multiple
      row :is_required
      row :is_magic
      row :domain_magic
      row :organisation
      row :is_magic_items
      row :is_magic_standards
      row :is_extra_items
      row :is_unique_choice
      row :is_upgratable
      row :value_points_upgrade
      row :upgrade_target
      row :max
      row :max_model
      row :min_model
      row :max_unit
    end
    panel 'Translations' do
      translate_attributes_table_for model do
        row :name
      end
    end
  end
end
