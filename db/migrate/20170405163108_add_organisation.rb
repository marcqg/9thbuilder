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

    create_table :ninth_age_units_organisations, id: false do |t|
      t.belongs_to :unit, index: false, null: false, default: 0
      t.belongs_to :organisation, index: false, null: false, default: 0
    end
    add_foreign_key :ninth_age_units_organisations, :units, column: :unit_id
    add_foreign_key :ninth_age_units_organisations, :ninth_age_organisations, column: :organisation_id

    add_index :ninth_age_units_organisations, [ :unit_id, :organisation_id ], name: 'ninth_age_units_organisations_unit_organisation'
    add_index :ninth_age_units_organisations, [ :organisation_id, :unit_id ], name: 'ninth_age_units_organisations_organisation_unit'


    unit_categories = UnitCategory.all

    Army.all.each do |army|

      army_organisation = NinthAge::ArmyOrganisation.create!({ :name => 'Army organisation', :army_id => army.id })

      unit_categories.each do |unit_category|

        organisation = NinthAge::Organisation.create!({ :name => unit_category.name, :army_id => army.id })

        organisation_group = NinthAge::OrganisationGroup.create!({ army_organisation_id: army_organisation.id, organisation_id: organisation.id })
        if unit_category.min_quota != nil
          organisation_group.type_target = :Min
          organisation_group.target = unit_category.min_quota
        elsif unit_category.max_quota != nil
          organisation_group.type_target = :Max
          organisation_group.target = unit_category.max_quota
        end
        organisation_group.save

        Unit.where({ army_id: army.id, unit_category_id: unit_category.id }).each do |unit|

          unit.organisations << organisation
          unit.save

        end

      end

    end

    remove_column :units, :unit_category_id
    remove_column :army_list_units, :unit_category_id
    drop_table :unit_category_translations
    drop_table :unit_categories

  end
end
