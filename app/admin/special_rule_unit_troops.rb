ActiveAdmin.register NinthAge::SpecialRuleUnitTroop do
  menu parent: 'Ninth Age Unit Specialisations', priority: 6

  permit_params :unit_id, :troop_id, :special_rule_id, :position

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
    params[:special_rule_unit_troop].each_with_index do |id, index|
      NinthAge::SpecialRuleUnitTroop.update_all({position: index + 1}, unit_id: params[:unit_id], id: id)
    end
    render nothing: true
  end

  filter :unit
  filter :special_rule
  filter :name

  index do
    selectable_column
    id_column
    column :unit, sortable: :unit_id
    column :special_rule, sortable: :special_rule_id
    column :troop, sortable: :troop_id
    column :position
    actions
  end

  form do |f|
    f.inputs do
      f.input :army_filter, as: :select, collection: NinthAge::Army.order(:name), disabled: NinthAge::Army.disabled.pluck(:id), label: 'Army FILTER'
      f.input :special_rule, collection: NinthAge::SpecialRule.all
      f.input :unit, collection: NinthAge::Unit.includes(:army).collect { |u| [u.army.name + ' - ' + u.name, u.id] }
      f.input :troop, collection: NinthAge::Troop.includes(unit: [:army]).collect { |t| [t.unit.army.name + ' - ' + t.unit.name + ' - ' + t.name, t.id] }
      f.input :position
    end
    f.actions
  end
end
