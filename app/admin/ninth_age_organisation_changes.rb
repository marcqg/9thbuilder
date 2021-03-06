ActiveAdmin.register NinthAge::OrganisationChange do
  menu parent: 'Ninth Age Army', priority: 6

  permit_params :default_organisation_id, :new_organisation_id, :unit_id, :type_target, :number

  filter :version_filter, as: :select, collection: -> { NinthAge::Version.includes(:translations).map { |version| [ version.name, version.id ] } } 
  filter :army_filter, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:q_version_filter/armies', 'data-option-observed' => 'q_version_filter'}, collection: -> { NinthAge::Army.where(:version_id => NinthAge::Version.last.id).includes(:translations).map { |army| [ army.name, army.id ] } } 
  filter :unit, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/unit-:q_army_filter/units/all', 'data-option-observed' => 'q_army_filter'}, collection: -> { [] } 
  filter :default_organisation, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:q_army_filter/organisations', 'data-option-observed' => 'q_army_filter'}, collection: -> { [] } 
  filter :new_organisation, as: :select, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:q_army_filter/organisations', 'data-option-observed' => 'q_army_filter'}, collection: -> { [] } 

  controller do
    def scoped_collection
      end_of_association_chain.includes(unit: [:translations]).includes(default_organisation: [:translations]).includes(new_organisation: [:translations])
    end
  end

  index do
    selectable_column
    id_column
    column :unit, sortable: :unit_id
    column :default_organisation, sortable: :default_organisation_id
    column :new_organisation, sortable: :new_organisation_id
    column :type_target
    column :number
    actions
  end

  form do |f|
    f.inputs do
      f.input :unit_army, include_blank: false, collection: NinthAge::Army.includes(:translations).includes(:version).order(:name).collect { |o| [o.name + ' - ' + o.version.name, o.id] }, :prompt => true
      f.input :unit, as: :select, include_blank: false, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_organisation_change_unit_army/units', 'data-option-observed' => 'ninth_age_organisation_change_unit_army'}, :collection => (resource.unit_army ? resource.unit_army.units.collect {|unit| [unit.name, unit.id]} : [])
      f.input :default_organisation, as: :select, include_blank: false, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/unit-:ninth_age_organisation_change_unit_id/organisations', 'data-option-observed' => 'ninth_age_organisation_change_unit_id'}, :collection => (resource.unit ? resource.unit.organisations.collect {|organisation| [organisation.name, organisation.id]} : [])
      f.input :new_organisation, as: :select, include_blank: false, :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_organisation_change_unit_army/organisations', 'data-option-observed' => 'ninth_age_organisation_change_unit_army'}, :collection => (resource.unit_army ? resource.unit_army.organisations.collect {|organisation| [organisation.name, organisation.id]} : [])
      f.input :type_target, as: :select, include_blank: false, collection: NinthAge::OrganisationChange.type_targets.keys.collect { |type_target| [I18n.t("unit.type_target.#{type_target}", default: type_target.titleize), type_target] }, include_hidden: false
      f.input :number
    end
    f.actions
  end
end
