ActiveAdmin.register NinthAge::OrganisationGroup do
  menu parent: 'Ninth Age Army', priority: 4

  permit_params :army_organisation_id, :organisation_id, :type_target, :target

  filter :army_organisation, as: :select, collection: -> { NinthAge::ArmyOrganisation.includes(:translations).map { |arm| [ arm.name, arm.id ] } } 
  filter :organisation, as: :select, collection: -> { NinthAge::Organisation.includes(:translations).map { |org| [ org.name, org.id ] } } 

    controller do
    def scoped_collection
      end_of_association_chain.includes(army_organisation: [:translations]).includes(organisation: [:translations])
    end
  end

  form do |f|
    f.inputs do
      f.input :version_filter, as: :select, 
              collection: NinthAge::Version.includes(:translations).order(:name).collect { |o| [o.name, o.id] }, label: 'Version FILTER'
      
      f.input :army_filter, as: :select, 
              :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/version-:ninth_age_organisation_group_version_filter/armies', 'data-option-observed' => 'ninth_age_organisation_group_version_filter'}, 
              :collection => (resource.version ? resource.version
                                                  .armies
                                                  .includes(:translations)
                                                  .with_locales(I18n.locale)
                                                  .ordered
                                                  .collect {|army| [army.name, army.id]} : [])
                                                  
      f.input :army_organisation, as: :select, 
      :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_organisation_group_army_filter/army_organisations', 'data-option-observed' => 'ninth_age_organisation_group_army_filter'}, 
      :collection => (resource.army ? resource.army
                                          .army_organisations
                                          .includes(:translations)
                                          .with_locales(I18n.locale)
                                          .ordered
                                          .collect {|org| [org.name, org.id]} : [])
                                                  
      f.input :organisation, as: :select, 
      :input_html => {'data-option-dependent' => true, 'data-option-url' => '/ninth_age/army-:ninth_age_organisation_group_army_filter/organisations', 'data-option-observed' => 'ninth_age_organisation_group_army_filter'}, 
      :collection => (resource.army ? resource.army
                                          .organisations
                                          .includes(:translations)
                                          .with_locales(I18n.locale)
                                          .ordered
                                          .collect {|org| [org.name, org.id]} : [])

      f.input :type_target

      f.input :target
    end

    f.actions
  end
end
