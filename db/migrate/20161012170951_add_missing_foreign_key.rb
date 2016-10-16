class AddMissingForeignKey < ActiveRecord::Migration
  def up
    execute 'DELETE FROM `army_list_unit_troops` WHERE `army_list_unit_id` NOT IN (SELECT `id` FROM `army_list_units`)'
    execute 'DELETE FROM `army_list_unit_troops` WHERE `troop_id` NOT IN (SELECT `id` FROM `troops`)'

    add_foreign_key :army_list_unit_troops, :army_list_units, on_delete: :cascade
    add_foreign_key :army_list_unit_troops, :troops, on_delete: :cascade
  end

  def down
    remove_foreign_key :army_list_unit_troops, :army_list_units
    remove_foreign_key :army_list_unit_troops, :troops
  end
end
