ActiveAdmin.register NinthAge::EquipmentUnitTroop do
  menu parent: 'Ninth Age Unit Specialisations', priority: 2

  permit_params :unit_id, :troop_id, :equipment_id, :position, :locale, translations_attributes: [:id, :info, :locale, :_destroy]

  config.filters = false

  controller do
    def scoped_collection
      end_of_association_chain.includes(troop: [:translations]).includes(equipment: [:translations]).includes(unit: [:translations])
    end
    
    def create
      create! do |format|
        format.html { redirect_to new_admin_ninth_age_equipment_unit_troop_path({'ninth_age_equipment_unit_troop[unit_id]': resource.unit_id, 'ninth_age_equipment_unit_troop[troop_id]': resource.troop_id, 'ninth_age_equipment_unit_troop[position]': resource.unit.equipment_unit_troops.size + 1}) }
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

  collection_action :sort, method: :post do
    params[:ninth_age_equipment_unit_troop].each_with_index do |id, index|
      NinthAge::EquipmentUnitTroop.update_all({ position: index + 1 }, unit_id: params[:unit_id])
    end
    render nothing: true
  end

  index do
    selectable_column
    id_column
    column :unit, sortable: :unit_id
    column :equipment, sortable: :equipment_id
    column :troop, sortable: :troop_id
    column :position
    actions
  end

  form do |f|
    f.inputs do
      f.input :version_filter, as: :select, label: 'Version FILTER', 
              collection: NinthAge::Version.includes(:translations)
                                                  .order(:name)
                                                  .collect { |o| [o.name, o.id] }
      f.input :army_filter, as: :select, 
              :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_equipment_unit_troop_version_filter/armies', 'data-option-observed' => 'ninth_age_equipment_unit_troop_version_filter'}, 
              :collection => (resource.version ? resource.version
                                                  .armies
                                                  .includes(:translations)
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .collect {|army| [army.name, army.id]} : [])
      f.input :unit, as: :select, 
              :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_equipment_unit_troop_army_filter/units', 'data-option-observed' => 'ninth_age_equipment_unit_troop_army_filter'}, 
              :collection => (resource.army ? resource.army
                                                  .units
                                                  .includes(:translations)
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .collect {|unit| [unit.name, unit.id]} : [])
      f.input :troop, as: :select, 
              :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_equipment_unit_troop_unit/units', 'data-option-observed' => 'ninth_age_equipment_unit_troop_unit'}, 
              :collection => (resource.unit ? resource.unit
                                                  .troops
                                                  .includes(:translations)
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .collect {|troop| [troop.name, troop.id]} : [])

      f.input :position

      f.input :equipment, as: :select, 
              :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_equipment_unit_troop_version_filter/equipments/all', 'data-option-observed' => 'ninth_age_equipment_unit_troop_version_filter'}, 
              :collection => (resource.version ? resource.version
                                                  .equipments
                                                  .includes(:translations)
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .collect {|equipment| [equipment.name, equipment.id]} : [])

      f.translate_inputs do |t|
        t.input :info
      end
    end
    f.actions
  end

  show do |model|
    attributes_table do
      row :version_filter
      row :army_filter
      row :unit
      row :troop
      row :position
      row :equipment
    end

    panel 'Translations' do
      translate_attributes_table_for model do
        row :info
      end
    end
  end
end
