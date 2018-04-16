ActiveAdmin.register NinthAge::UnitOption do
  menu parent: 'Ninth Age Army', priority: 10

  permit_params :unit_id, :parent_id, :unit_option_activator_id, :mount_id, :category, :unit_link_id, :is_required, :value_points, :position, :has_one_choise, :is_per_model, :is_multiple, :is_magic, :is_upgratable, :domain_magic_id, :organisation_id, :extra_item_id, :value_points_upgrade, :upgrade_target, :max, :max_model, :min_model, :max_unit, :is_magic_items, :is_magic_standards, :banner_limit, :is_extra_items, :is_unique_choice, :locale, translations_attributes: [:id, :name, :infos, :locale, :_destroy]

  filter :value_points

  controller do
    def scoped_collection
      end_of_association_chain.includes(:translations).includes(unit: [:translations]).includes(mount: [:translations])
    end

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
      f.input :army_filter, as: :select, collection: NinthAge::Army.includes(:translations).includes(version: [:translations]).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }, disabled: NinthAge::Army.disabled.pluck(:id)
      f.input :unit, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_option_army_filter/units', 'data-option-observed' => 'ninth_age_unit_option_army_filter'}, :collection => (resource.army ? resource.army.units.collect {|unit| [unit.name, unit.id]} : [])
      f.input :category
      f.input :parent, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/unit-:ninth_age_unit_option_unit_id/unit_options', 'data-option-observed' => 'ninth_age_unit_option_unit_id'}, :collection => (resource.unit ? resource.unit.unit_options.collect {|unit_option| [unit_option.name, unit_option.id]} : [])
      f.input :unit_option_activator, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/unit-:ninth_age_unit_option_unit_id/unit_options', 'data-option-observed' => 'ninth_age_unit_option_unit_id'}, :collection => (resource.unit ? resource.unit.unit_options.collect {|unit_option| [unit_option.name, unit_option.id]} : [])
      f.translate_inputs do |t|
        t.input :name
        t.input :infos
      end
      f.input :position
      f.input :value_points
      f.input :has_one_choise
      f.input :is_per_model
      f.input :is_multiple
      f.input :is_magic_items
      f.input :is_magic_standards
      f.input :banner_limit
      f.input :is_extra_items
      f.input :is_magic
      f.input :domain_magic, collection: NinthAge::DomainMagic.includes(:translations).includes(version: [:translations]).collect { |u| [u.name + ' - ' + u.version.name, u.id] }
      f.input :mount, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_option_army_filter/mounts', 'data-option-observed' => 'ninth_age_unit_option_army_filter'}, :collection => (resource.army ? resource.army.units.collect {|unit| [unit.name, unit.id]} : [])
      f.input :unit_link, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_option_army_filter/units', 'data-option-observed' => 'ninth_age_unit_option_army_filter'}, :collection => (resource.army ? resource.army.units.collect {|unit| [unit.name, unit.id]} : [])
      f.input :organisation, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_option_army_filter/organisations', 'data-option-observed' => 'ninth_age_unit_option_army_filter'}, :collection => (resource.army ? resource.army.organisations.collect {|organisation| [organisation.name, organisation.id]} : [])
      f.input :extra_item, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_unit_option_army_filter/extra_items', 'data-option-observed' => 'ninth_age_unit_option_army_filter'}, :collection => (resource.army ? resource.army.extra_items.collect {|extra_item| [extra_item.name, extra_item.id]} : [])
      f.input :is_upgratable
      f.input :value_points_upgrade
      f.input :upgrade_target
      f.input :max
      f.input :max_model
      f.input :min_model
      f.input :max_unit
      f.input :is_required
      f.input :is_unique_choice
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :army
      row :unit
      row :category
      row :parent
      row :unit_option_activator
      row :mount
      row :unit_link
      row :value_points
      row :position
      row :has_one_choise
      row :is_per_model
      row :is_multiple
      row :is_required
      row :is_magic
      row :domain_magic
      row :organisation
      row :extra_item
      row :is_magic_items
      row :is_magic_standards
      row :banner_limit
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
        row :infos
      end
    end
  end
end
