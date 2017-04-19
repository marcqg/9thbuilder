class AddOrganisation < ActiveRecord::Migration[5.0]
  def change

  	create_table :ninth_age_army_organisations do |t|
      t.belongs_to :army, index: false, null: false, default: 0
      t.timestamps
    end
    add_foreign_key :ninth_age_army_organisations, :armies, column: :army_id

    NinthAge::ArmyOrganisation.create_translation_table! :name => :string, :description => :string
    add_foreign_key :ninth_age_army_organisation_translations, :ninth_age_army_organisations, column: :ninth_age_army_organisation_id, on_delete: :cascade

    create_table :ninth_age_organisations do |t|
      t.belongs_to :army, index: false, null: false, default: 0
      t.boolean :isSpecialRule, null: false, default: false
      t.timestamps
    end
    add_attachment :ninth_age_organisations, :logo
    add_foreign_key :ninth_age_organisations, :armies, column: :army_id

    NinthAge::Organisation.create_translation_table! :name => :string
    add_foreign_key :ninth_age_organisation_translations, :ninth_age_organisations, column: :ninth_age_organisation_id, on_delete: :cascade

    create_table :ninth_age_organisation_groups do |t|
      t.belongs_to :army_organisation, null: false, default: 0
      t.belongs_to :organisation, null: false, default: 0
      t.column :type_target, :integer, default: 0
      t.integer :target, null: false, default: 0
      t.timestamps
    end
    add_foreign_key :ninth_age_organisation_groups, :ninth_age_army_organisations, column: :army_organisation_id
    add_foreign_key :ninth_age_organisation_groups, :ninth_age_organisations, column: :organisation_id

    create_table :ninth_age_organisation_changes do |t|
      t.belongs_to :default_organisation, index: true, null: false, default: 0,  :references => [:organisations, :id]
      t.belongs_to :new_organisation, index: true, null: false, default: 0, :references => [:organisations, :id]
      t.belongs_to :unit, index: true, null: false, default: 0
      t.integer :number, null: false, default: 0
      t.column :type_target, :integer, default: 0

      t.timestamps
    end
    add_foreign_key :ninth_age_organisation_changes, :ninth_age_organisations, column: :default_organisation_id
    add_foreign_key :ninth_age_organisation_changes, :ninth_age_organisations, column: :new_organisation_id
    add_foreign_key :ninth_age_organisation_changes, :units, column: :unit_id

    create_table :ninth_age_organisations_units, id: false do |t|
      t.belongs_to :unit, index: false, null: false, default: 0
      t.belongs_to :organisation, index: false, null: false, default: 0
    end
    add_foreign_key :ninth_age_organisations_units, :units, column: :unit_id
    add_foreign_key :ninth_age_organisations_units, :ninth_age_organisations, column: :organisation_id

    add_index :ninth_age_organisations_units, [ :unit_id, :organisation_id ], name: 'ninth_age_units_organisations_unit_organisation', :unique => true
    add_index :ninth_age_organisations_units, [ :organisation_id, :unit_id ], name: 'ninth_age_units_organisations_organisation_unit', :unique => true

    create_table :ninth_age_army_list_organisations do |t|
      t.belongs_to :army_list, index: false, null: false, default: 0
      t.belongs_to :organisation, index: false, null: false, default: 0
      t.integer :pts, null: false, default: 0
      t.integer :rate, null: false, default: 0
      t.boolean :good, null: false, default: false
    end
    add_foreign_key :ninth_age_army_list_organisations, :army_lists, column: :army_list_id
    add_foreign_key :ninth_age_army_list_organisations, :ninth_age_organisations, column: :organisation_id

    add_index :ninth_age_army_list_organisations, [ :army_list_id, :organisation_id ], name: 'ninth_age_army_list_organisations_army_list_organisation', :unique => true
    add_index :ninth_age_army_list_organisations, [ :organisation_id, :army_list_id ], name: 'ninth_age_army_list_organisations_organisation_army_list', :unique => true

    unit_categories = ArmyList.connection.select_all "SELECT uc.id as id, uc.name as name, uc.min_quota as min_quota, uc.max_quota as max_quota FROM unit_categories uc;"

    Army.all.each do |army|

      army_organisation = NinthAge::ArmyOrganisation.create!({ :name => 'Army organisation', :army_id => army.id })

      unit_categories.each do |unit_category|

        organisation = NinthAge::Organisation.create!({ :name => unit_category['name'], :army_id => army.id })

        organisation_group = NinthAge::OrganisationGroup.create!({ army_organisation_id: army_organisation.id, organisation_id: organisation.id })
        if unit_category['min_quota'] != nil
          organisation_group.type_target = :Least
          organisation_group.target = unit_category['min_quota']
        elsif unit_category['max_quota'] != nil
          organisation_group.type_target = :Max
          organisation_group.target = unit_category['max_quota']
        end
        organisation_group.save

        Unit.where({ army_id: army.id, unit_category_id: unit_category['id'] }).each do |unit|

          unit.organisations << organisation
          unit.save

        end
      end
    end

    add_column :army_lists, :army_organisation_id, :integer, :default => 0, :null => true
    add_index :army_lists, :army_organisation_id

    ActiveRecord::Base.connection.execute('UPDATE army_lists
                                      SET army_organisation_id = (SELECT id FROM ninth_age_army_organisations WHERE army_lists.army_id = ninth_age_army_organisations.army_id)
                                      where army_organisation_id = 0;')

    add_foreign_key :army_lists, :army_organisations, column: :army_organisation_id, on_delete: :cascade

    remove_foreign_key :units, :unit_categories
    remove_index :units, :unit_category_id
    remove_column :units, :unit_category_id

    remove_index :army_list_units, :unit_category_id
    remove_column :army_list_units, :unit_category_id

    drop_table :unit_categories

  end
end
