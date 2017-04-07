class AddOrganisation < ActiveRecord::Migration[5.0]
  def change

  	create_table :ninth_age_army_organisations do |t|
      t.belongs_to :army, index: false, null: false, default: 0
      t.timestamps
    end
    add_foreign_key :ninth_age_army_organisations, :armies, column: :army_id

    reversible do |dir|
      dir.up do
        NinthAge::ArmyOrganisation.create_translation_table! :name => :string, :description => :string
      end

      dir.down do
        NinthAge::ArmyOrganisation.drop_translation_table!
      end
    end

    create_table :ninth_age_organisations do |t|
      t.belongs_to :army, index: false, null: false, default: 0
      t.boolean :isSpecialRule, null: false, default: false
      t.timestamps
    end
    add_foreign_key :ninth_age_organisations, :armies, column: :army_id

    reversible do |dir|
      dir.up do
        NinthAge::Organisation.create_translation_table! :name => :string
      end

      dir.down do
        NinthAge::Organisation.drop_translation_table!
      end
    end

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
      t.belongs_to :figurine, index: true, null: false, default: 0
      t.integer :number, null: false, default: 0
      t.column :type_target, :integer, default: 0

      t.timestamps
    end

  end
end
