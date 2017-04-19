class AddGlobalizeFields < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Army.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :army_translations, :armies, column: :army_id, on_delete: :cascade
        Equipment.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :equipment_translations, :equipments, column: :equipment_id, on_delete: :cascade
        ExtraItemCategory.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :extra_item_category_translations, :extra_item_categories, column: :extra_item_category_id, on_delete: :cascade
        ExtraItem.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :extra_item_translations, :extra_items, column: :extra_item_id, on_delete: :cascade
        MagicItemCategory.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :magic_item_category_translations, :magic_item_categories, column: :magic_item_category_id, on_delete: :cascade
        MagicItem.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :magic_item_translations, :magic_items, column: :magic_item_id, on_delete: :cascade
        MagicStandard.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :magic_standard_translations, :magic_standards, column: :magic_standard_id, on_delete: :cascade
        SpecialRule.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :special_rule_translations, :special_rules, column: :special_rule_id, on_delete: :cascade
        TroopType.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :troop_type_translations, :troop_types, column: :troop_type_id, on_delete: :cascade
        Troop.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :troop_translations, :troops, column: :troop_id, on_delete: :cascade
        UnitOption.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :unit_option_translations, :unit_options, column: :unit_option_id, on_delete: :cascade
        Unit.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        add_foreign_key :unit_translations, :units, column: :unit_id, on_delete: :cascade
      end

      dir.down do
        Army.drop_translation_table! :migrate_data => true
        Equipment.drop_translation_table! :migrate_data => true
        ExtraItemCategory.drop_translation_table! :migrate_data => true
        ExtraItem.drop_translation_table! :migrate_data => true
		    MagicItemCategory.drop_translation_table! :migrate_data => true
		    MagicItem.drop_translation_table! :migrate_data => true
        MagicStandard.drop_translation_table! :migrate_data => true
        SpecialRule.drop_translation_table! :migrate_data => true
        TroopType.drop_translation_table! :migrate_data => true
        Troop.drop_translation_table! :migrate_data => true
        UnitOption.drop_translation_table! :migrate_data => true
        Unit.drop_translation_table! :migrate_data => true
      end
    end
  end
end
