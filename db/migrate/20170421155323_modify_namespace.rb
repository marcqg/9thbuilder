class ModifyNamespace < ActiveRecord::Migration[5.0]
  def change

    # rename_table :special_rules, :ninth_age_special_rules
    # NinthAge::SpecialRule.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
    # add_column :ninth_age_special_rule_translations, :description, :text, :null => true
    # add_foreign_key :ninth_age_special_rule_translations, :ninth_age_special_rules, column: :ninth_age_special_rule_id, on_delete: :cascade
    #
    # create_table :ninth_age_special_rule_troops, id: false  do |t|
    #   t.belongs_to :special_rule, index: false, null: false, default: 0
    #   t.belongs_to :troop, index: false, null: false, default: 0
    #   t.timestamps
    # end
    # add_foreign_key :ninth_age_special_rule_troops, :ninth_age_special_rules, column: :special_rule_id
    # add_foreign_key :ninth_age_special_rule_troops, :troops, column: :troop_id
    #
    # add_index :ninth_age_special_rule_troops, [ :special_rule_id, :troop_id ], name: 'ninth_age_special_rule_troops_rule_troop'
    # add_index :ninth_age_special_rule_troops, [ :troop_id, :special_rule_id ], name: 'ninth_age_special_rule_troops_troop_rule'
    #
    # create_table :ninth_age_special_rule_units, id: false  do |t|
    #   t.belongs_to :special_rule, index: false, null: false, default: 0
    #   t.belongs_to :unit, index: false, null: false, default: 0
    #   t.timestamps
    # end
    # add_foreign_key :ninth_age_special_rule_units, :ninth_age_special_rules, column: :special_rule_id
    # add_foreign_key :ninth_age_special_rule_units, :units, column: :unit_id
    #
    # add_index :ninth_age_special_rule_units, [ :special_rule_id, :unit_id ], name: 'ninth_age_special_rule_units_rule_unit'
    # add_index :ninth_age_special_rule_units, [ :unit_id, :special_rule_id ], name: 'ninth_age_special_rule_units_unit_rule'

    # ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_special_rule_troops (special_rule_id, troop_id, created_at, updated_at)
    #                                   SELECT id, troop_id, NOW(), NOW() FROM ninth_age_special_rules where troop_id is not null;')
    #
    # ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_special_rule_units (special_rule_id, unit_id, created_at, updated_at)
    #                                   SELECT id, unit_id, NOW(), NOW() FROM ninth_age_special_rules where unit_id is not null;')

    # remove_foreign_key :ninth_age_special_rules, :troops
    # remove_column :ninth_age_special_rules, :troop_id
    #
    # remove_foreign_key :ninth_age_special_rules, :units
    # remove_column :ninth_age_special_rules, :unit_id


  end
end
