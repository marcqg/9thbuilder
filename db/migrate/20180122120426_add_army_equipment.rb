class AddArmyEquipment < ActiveRecord::Migration[5.0]
  def change
  	#equipment by army
    add_column :ninth_age_equipments, :army_id, :integer, default: nil, null: true

    add_index :ninth_age_equipments,  :army_id, :name => 'index_ninth_age_equipments_on_army_id'
    add_foreign_key :ninth_age_equipments, :ninth_age_armies, column: :army_id, on_delete: :cascade


    #extra item for option
    add_column :ninth_age_unit_options, :extra_item_id, :integer, default: nil, null: true

    add_index :ninth_age_unit_options,  :extra_item_id, :name => 'index_ninth_age_unit_options_on_extra_item_id'
    add_foreign_key :ninth_age_unit_options, :ninth_age_extra_items, column: :extra_item_id, on_delete: :cascade

    add_column :ninth_age_unit_options, :unit_option_activator_id, :integer, default: nil, null: true

    add_index :ninth_age_unit_options,  :unit_option_activator_id, :name => 'index_ninth_age_unit_options_on_unit_option_activator_id'
    add_foreign_key :ninth_age_unit_options, :ninth_age_unit_options, column: :unit_option_activator_id, on_delete: :cascade


    NinthAge::UnitOption.add_translation_fields! infos: :text


    add_index :ninth_age_version_translations,  :ninth_age_version_id, :name => 'index_ninth_age_versions_on_version_id'
    add_foreign_key :ninth_age_version_translations, :ninth_age_versions, column: :ninth_age_version_id, on_delete: :cascade

    #add_index :ninth_age_equipments,  :version_id, :name => 'index_ninth_age_equipments_on_version_id'
    add_foreign_key :ninth_age_equipments, :ninth_age_versions, column: :version_id, on_delete: :cascade

    #add_index :ninth_age_extra_items,  :version_id, :name => 'index_ninth_age_extra_items_on_version_id'

  	NinthAge::ExtraItem.where(:version_id => 0).update_all(:version_id => 3)
    add_foreign_key :ninth_age_extra_items, :ninth_age_versions, column: :version_id, on_delete: :cascade

    #add_index :ninth_age_magic_standards,  :version_id, :name => 'index_ninth_age_magic_standards_on_version_id'
    add_foreign_key :ninth_age_magic_standards, :ninth_age_versions, column: :version_id, on_delete: :cascade

    #add_index :ninth_age_special_rules,  :version_id, :name => 'index_ninth_age_special_rules_on_version_id'
    add_foreign_key :ninth_age_special_rules, :ninth_age_versions, column: :version_id, on_delete: :cascade

    #add_index :ninth_age_magic_items,  :version_id, :name => 'index_ninth_age_magic_items_on_version_id'
    add_foreign_key :ninth_age_magic_items, :ninth_age_versions, column: :version_id, on_delete: :cascade

    add_index :ninth_age_unit_options,  :organisation_id, :name => 'index_ninth_age_unit_options_on_organisation_id'
    add_foreign_key :ninth_age_unit_options, :ninth_age_organisations, column: :organisation_id, on_delete: :cascade

    add_index :ninth_age_units,  :unit_type_id, :name => 'index_ninth_age_units_on_unit_type_id'
  end
end
