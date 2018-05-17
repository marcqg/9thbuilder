ActiveAdmin.register NinthAge::SpecialRuleUnitTroop do
  menu parent: 'Ninth Age Unit Specialisations', priority: 6

  permit_params :unit_id, :troop_id, :special_rule_id, :position, :jet, :locale, translations_attributes: [:id, :info, :locale, :_destroy]

  config.filters = false

  controller do
    def scoped_collection
      end_of_association_chain.includes(troop: [:translations]).includes(special_rule: [:translations]).includes(unit: [:translations])
    end
    
    def create
      create! do |format|
        format.html { redirect_to new_admin_ninth_age_special_rule_unit_troop_path({'ninth_age_special_rule_unit_troop[unit_id]': resource.unit_id, 'ninth_age_special_rule_unit_troop[troop_id]': resource.troop_id, 'ninth_age_special_rule_unit_troop[position]': resource.unit.special_rule_unit_troops.size + 1}) }
      end
    end
  end
  
  before_action only: [:create, :update] do
    params[:ninth_age_special_rule_unit_troop][:translations_attributes].each do |k,v|
      if v.except('id', 'locale').all? { |_,v| v.blank? }
        v.merge!(_destroy: '1')
        params[:ninth_age_special_rule_unit_troop][:translations_attributes][k] = v
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

  collection_action :sort, method: :post do
    params[:special_rule_unit_troop].each_with_index do |id, index|
      NinthAge::SpecialRuleUnitTroop.update_all({position: index + 1}, unit_id: params[:unit_id], id: id)
    end
    render nothing: true
  end

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
      f.input :version_filter, as: :select, 
              collection: NinthAge::Version.includes(:translations).order(:name).collect { |o| [o.name, o.id] }, label: 'Version FILTER'
      
      f.input :army_filter, as: :select, 
              :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_special_rule_unit_troop_version_filter/armies', 'data-option-observed' => 'ninth_age_special_rule_unit_troop_version_filter'}, 
              :collection => (resource.version ? resource.version
                                                  .armies
                                                  .includes(:translations)
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .collect {|army| [army.name, army.id]} : [])
      
      f.input :unit, as: :select, 
              :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_special_rule_unit_troop_army_filter/units', 'data-option-observed' => 'ninth_age_special_rule_unit_troop_army_filter'}, 
              :collection => (resource.army ? resource.army
                                                  .units
                                                  .includes(:translations)
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .collect {|unit| [unit.name, unit.id]} : [])
      
      f.input :troop, as: :select, 
              :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_special_rule_unit_troop_unit/units', 'data-option-observed' => 'ninth_age_special_rule_unit_troop_unit'}, 
              :collection => (resource.unit ? resource.unit
                                                  .troops
                                                  .includes(:translations)
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .collect {|troop| [troop.name, troop.id]} : [])
      
      f.input :position

      f.input :special_rule, as: :select, 
              :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_special_rule_unit_troop_army_filter/special_rules/all', 'data-option-observed' => 'ninth_age_special_rule_unit_troop_army_filter'}, 
              :collection => (resource.version ? resource.version
                                                  .special_rules
                                                  .includes(:translations)
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .collect {|special_rule| [special_rule.name, special_rule.id]} : [])

      f.input :jet
      
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
      row :special_rule
      row :jet
    end

    panel 'Translations' do
      translate_attributes_table_for model do
        row :info
      end
    end
  end
end
