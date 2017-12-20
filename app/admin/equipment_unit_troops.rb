ActiveAdmin.register NinthAge::EquipmentUnitTroop do
  menu parent: 'Ninth Age Unit Specialisations', priority: 2

  permit_params :unit_id, :troop_id, :equipment_id, :position

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

  filter :unit
  filter :equipment
  filter :name

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
      f.input :army_filter, as: :select, collection: NinthAge::Army.includes(:translations).includes(version: [:translations]).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }, disabled: NinthAge::Army.disabled.pluck(:id), label: 'Army FILTER'
      f.input :unit, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_equipment_unit_troop_army_filter/units', 'data-option-observed' => 'ninth_age_equipment_unit_troop_army_filter'}, :collection => (resource.army ? resource.army.units.collect {|unit| [unit.name, unit.id]} : [])
      f.input :troop, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_equipment_unit_troop_unit/units', 'data-option-observed' => 'ninth_age_equipment_unit_troop_unit'}, :collection => (resource.unit ? resource.unit.troops.collect {|troop| [troop.name, troop.id]} : [])
      f.input :equipment, collection: NinthAge::Equipment.includes(:translations).includes(version: [:translations]).collect { |o| [o.name + ' - ' + o.version.name, o.id] }
      f.input :position
    end
    f.actions
  end
end
