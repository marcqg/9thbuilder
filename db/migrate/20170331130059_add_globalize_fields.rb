class AddGlobalizeFields < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Army.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        Equipment.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        ExtraItemCategory.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        ExtraItem.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        MagicItemCategory.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        MagicItem.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        MagicStandard.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        SpecialRule.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        TroopType.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        Troop.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        UnitCategory.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        UnitOption.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
        Unit.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
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
        UnitCategory.drop_translation_table! :migrate_data => true
        UnitOption.drop_translation_table! :migrate_data => true
        Unit.drop_translation_table! :migrate_data => true
      end
    end
  end
end
