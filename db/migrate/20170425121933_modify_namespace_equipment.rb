class ModifyNamespaceEquipment < ActiveRecord::Migration[5.0]
  def change

    rename_table :equipments, :ninth_age_equipments
    NinthAge::Equipment.create_translation_table!({ :name => :string }, { :migrate_data => true, :remove_source_columns => true })
    add_column :ninth_age_equipment_translations, :description, :text, :null => true
    add_foreign_key :ninth_age_equipment_translations, :ninth_age_equipments, column: :ninth_age_equipment_id, on_delete: :cascade

    create_table :ninth_age_equipments_troops, id: false  do |t|
      t.belongs_to :equipment, index: false, null: false, default: 0
      t.belongs_to :troop, index: false, null: false, default: 0
      t.timestamps
    end
    add_foreign_key :ninth_age_equipments_troops, :ninth_age_equipments, column: :equipment_id
    add_foreign_key :ninth_age_equipments_troops, :troops, column: :troop_id

    add_index :ninth_age_equipments_troops, [ :equipment_id, :troop_id ], name: 'ninth_age_equipments_troops_rule_troop'
    add_index :ninth_age_equipments_troops, [ :troop_id, :equipment_id ], name: 'ninth_age_equipments_troops_troop_rule'

    create_table :ninth_age_equipments_units, id: false  do |t|
      t.belongs_to :equipment, index: false, null: false, default: 0
      t.belongs_to :unit, index: false, null: false, default: 0
      t.timestamps
    end
    add_foreign_key :ninth_age_equipments_units, :ninth_age_equipments, column: :equipment_id
    add_foreign_key :ninth_age_equipments_units, :units, column: :unit_id

    add_index :ninth_age_equipments_units, [ :equipment_id, :unit_id ], name: 'ninth_age_equipments_units_rule_unit'
    add_index :ninth_age_equipments_units, [ :unit_id, :equipment_id ], name: 'ninth_age_equipments_units_unit_rule'

    ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_equipments_troops (equipment_id, troop_id, created_at, updated_at)
                                      SELECT id, troop_id, NOW(), NOW() FROM ninth_age_equipments where troop_id is not null;')

    ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_equipments_units (equipment_id, unit_id, created_at, updated_at)
                                      SELECT id, unit_id, NOW(), NOW() FROM ninth_age_equipments where unit_id is not null;')

    remove_foreign_key :ninth_age_equipments, :troops
    remove_column :ninth_age_equipments, :troop_id

    remove_foreign_key :ninth_age_equipments, :units
    remove_column :ninth_age_equipments, :unit_id


    # ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_equipments_troops (equipment_id, troop_id, created_at, updated_at)
    # select new_id, troop_id, troops.created_at, troops.updated_at
    # from ninth_age_equipments_troops troops
    # INNER JOIN
    # (select T.ninth_age_equipment_id, t1.ninth_age_equipment_id as new_id
    # from ninth_age_equipment_translations T
    # LEFT OUTER JOIN (
    #                     SELECT MIN(ninth_age_equipment_id) as ninth_age_equipment_id, name as name
    # FROM ninth_age_equipment_translations
    # group by name
    # having count(*) > 1) as t1
    # ON T.ninth_age_equipment_id != t1.ninth_age_equipment_id AND T.name = t1.name
    # WHERE t1.ninth_age_equipment_id IS NOT NULL) as t2 ON troops.equipment_id = t2.ninth_age_equipment_id')
    #
    # ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_equipments_units (equipment_id, unit_id, created_at, updated_at)
    # select new_id, unit_id, units.created_at, units.updated_at
    # from ninth_age_equipments_units units
    # INNER JOIN
    # (select T.ninth_age_equipment_id, t1.ninth_age_equipment_id as new_id
    # from ninth_age_equipment_translations T
    # LEFT OUTER JOIN (
    #                     SELECT MIN(ninth_age_equipment_id) as ninth_age_equipment_id, name as name
    # FROM ninth_age_equipment_translations
    # group by name
    # having count(*) > 1) as t1
    # ON T.ninth_age_equipment_id != t1.ninth_age_equipment_id AND T.name = t1.name
    # WHERE t1.ninth_age_equipment_id IS NOT NULL) as t2 ON units.equipment_id = t2.ninth_age_equipment_id')
    #
    # ActiveRecord::Base.connection.execute('DELETE FROM ninth_age_equipments_troops
    # where equipment_id in (
    # select T.ninth_age_equipment_id
    # from ninth_age_equipment_translations T
    # LEFT OUTER JOIN (
    #                     SELECT MIN(ninth_age_equipment_id) as ninth_age_equipment_id, name as name
    # FROM ninth_age_equipment_translations
    # group by name
    # having count(*) > 1) as t1
    # ON T.ninth_age_equipment_id != t1.ninth_age_equipment_id AND T.name = t1.name
    # WHERE t1.ninth_age_equipment_id IS NOT NULL)')
    #
    # ActiveRecord::Base.connection.execute('DELETE FROM ninth_age_equipments_units
    # where equipment_id in (
    # select T.ninth_age_equipment_id
    # from ninth_age_equipment_translations T
    # LEFT OUTER JOIN (
    #                     SELECT MIN(ninth_age_equipment_id) as ninth_age_equipment_id, name as name
    # FROM ninth_age_equipment_translations
    # group by name
    # having count(*) > 1) as t1
    # ON T.ninth_age_equipment_id != t1.ninth_age_equipment_id AND T.name = t1.name
    # WHERE t1.ninth_age_equipment_id IS NOT NULL)')
    #
    # ActiveRecord::Base.connection.execute('delete FROM ninth_age_equipment_translations
    # where ninth_age_equipment_id not in (select equipment_id from ninth_age_equipments_troops)
    # and ninth_age_equipment_id not in (select equipment_id from ninth_age_equipments_units)')
    #
    # ActiveRecord::Base.connection.execute('delete FROM ninth_age_equipments
    # where id not in (select equipment_id from ninth_age_equipments_troops)
    # and id not in (select equipment_id from ninth_age_equipments_units)')

  end
end
