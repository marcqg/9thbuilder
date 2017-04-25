class ModifyNamespace < ActiveRecord::Migration[5.0]
  def change

    rename_table :special_rules, :ninth_age_special_rules
    NinthAge::SpecialRule.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
    add_column :ninth_age_special_rule_translations, :description, :text, :null => true
    add_foreign_key :ninth_age_special_rule_translations, :ninth_age_special_rules, column: :ninth_age_special_rule_id, on_delete: :cascade

    create_table :ninth_age_special_rules_troops, id: false  do |t|
      t.belongs_to :special_rule, index: false, null: false, default: 0
      t.belongs_to :troop, index: false, null: false, default: 0
      t.timestamps
    end
    add_foreign_key :ninth_age_special_rules_troops, :ninth_age_special_rules, column: :special_rule_id
    add_foreign_key :ninth_age_special_rules_troops, :troops, column: :troop_id

    add_index :ninth_age_special_rules_troops, [ :special_rule_id, :troop_id ], name: 'ninth_age_special_rules_troops_rule_troop'
    add_index :ninth_age_special_rules_troops, [ :troop_id, :special_rule_id ], name: 'ninth_age_special_rules_troops_troop_rule'

    create_table :ninth_age_special_rules_units, id: false  do |t|
      t.belongs_to :special_rule, index: false, null: false, default: 0
      t.belongs_to :unit, index: false, null: false, default: 0
      t.timestamps
    end
    add_foreign_key :ninth_age_special_rules_units, :ninth_age_special_rules, column: :special_rule_id
    add_foreign_key :ninth_age_special_rules_units, :units, column: :unit_id

    add_index :ninth_age_special_rules_units, [ :special_rule_id, :unit_id ], name: 'ninth_age_special_rules_units_rule_unit'
    add_index :ninth_age_special_rules_units, [ :unit_id, :special_rule_id ], name: 'ninth_age_special_rules_units_unit_rule'

    ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_special_rules_troops (special_rule_id, troop_id, created_at, updated_at)
                                      SELECT id, troop_id, NOW(), NOW() FROM ninth_age_special_rules where troop_id is not null;')

    ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_special_rules_units (special_rule_id, unit_id, created_at, updated_at)
                                      SELECT id, unit_id, NOW(), NOW() FROM ninth_age_special_rules where unit_id is not null;')

    remove_foreign_key :ninth_age_special_rules, :troops
    remove_column :ninth_age_special_rules, :troop_id

    remove_foreign_key :ninth_age_special_rules, :units
    remove_column :ninth_age_special_rules, :unit_id


    ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_special_rules_troops (special_rule_id, troop_id, created_at, updated_at)
    select new_id, troop_id, troops.created_at, troops.updated_at
    from ninth_age_special_rules_troops troops
    INNER JOIN
    (select T.ninth_age_special_rule_id, t1.ninth_age_special_rule_id as new_id
    from ninth_age_special_rule_translations T
    LEFT OUTER JOIN (
                        SELECT MIN(ninth_age_special_rule_id) as ninth_age_special_rule_id, name as name
    FROM ninth_age_special_rule_translations
    group by name
    having count(*) > 1) as t1
    ON T.ninth_age_special_rule_id != t1.ninth_age_special_rule_id AND T.name = t1.name
    WHERE t1.ninth_age_special_rule_id IS NOT NULL) as t2 ON troops.special_rule_id = t2.ninth_age_special_rule_id')

    ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_special_rules_units (special_rule_id, unit_id, created_at, updated_at)
    select new_id, unit_id, units.created_at, units.updated_at
    from ninth_age_special_rules_units units
    INNER JOIN
    (select T.ninth_age_special_rule_id, t1.ninth_age_special_rule_id as new_id
    from ninth_age_special_rule_translations T
    LEFT OUTER JOIN (
                        SELECT MIN(ninth_age_special_rule_id) as ninth_age_special_rule_id, name as name
    FROM ninth_age_special_rule_translations
    group by name
    having count(*) > 1) as t1
    ON T.ninth_age_special_rule_id != t1.ninth_age_special_rule_id AND T.name = t1.name
    WHERE t1.ninth_age_special_rule_id IS NOT NULL) as t2 ON units.special_rule_id = t2.ninth_age_special_rule_id')

    ActiveRecord::Base.connection.execute('DELETE FROM ninth_age_special_rules_troops
    where special_rule_id in (
    select T.ninth_age_special_rule_id
    from ninth_age_special_rule_translations T
    LEFT OUTER JOIN (
                        SELECT MIN(ninth_age_special_rule_id) as ninth_age_special_rule_id, name as name
    FROM ninth_age_special_rule_translations
    group by name
    having count(*) > 1) as t1
    ON T.ninth_age_special_rule_id != t1.ninth_age_special_rule_id AND T.name = t1.name
    WHERE t1.ninth_age_special_rule_id IS NOT NULL)')

    ActiveRecord::Base.connection.execute('DELETE FROM ninth_age_special_rules_units
    where special_rule_id in (
    select T.ninth_age_special_rule_id
    from ninth_age_special_rule_translations T
    LEFT OUTER JOIN (
                        SELECT MIN(ninth_age_special_rule_id) as ninth_age_special_rule_id, name as name
    FROM ninth_age_special_rule_translations
    group by name
    having count(*) > 1) as t1
    ON T.ninth_age_special_rule_id != t1.ninth_age_special_rule_id AND T.name = t1.name
    WHERE t1.ninth_age_special_rule_id IS NOT NULL)')

    ActiveRecord::Base.connection.execute('delete FROM ninth_age_special_rule_translations
    where ninth_age_special_rule_id not in (select special_rule_id from ninth_age_special_rules_troops)
    and ninth_age_special_rule_id not in (select special_rule_id from ninth_age_special_rules_units)')

    ActiveRecord::Base.connection.execute('delete FROM ninth_age_special_rules
    where id not in (select special_rule_id from ninth_age_special_rules_troops)
    and id not in (select special_rule_id from ninth_age_special_rules_units)')

  end
end
