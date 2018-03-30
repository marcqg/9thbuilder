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
end
