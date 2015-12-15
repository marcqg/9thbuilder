class AddForeignKeys < ActiveRecord::Migration
  def up
    add_foreign_key :users, :armies, column: :favorite_army_id, on_delete: :nullify

    add_foreign_key :extra_item_categories, :armies
    add_foreign_key :extra_items, :extra_item_categories

    add_foreign_key :magic_items, :armies
    add_foreign_key :magic_items, :magic_item_categories
    add_foreign_key :magic_items, :magic_items, column: :override_id

    add_foreign_key :magic_standards, :armies
    add_foreign_key :magic_standards, :magic_standards, column: :override_id

    add_foreign_key :units, :armies
    add_foreign_key :units, :unit_categories

    add_foreign_key :troops, :units
    add_foreign_key :troops, :troop_types
    add_foreign_key :troops, :unit_options, on_delete: :nullify

    add_foreign_key :equipments, :units
    add_foreign_key :equipments, :troops, on_delete: :nullify

    add_foreign_key :special_rules, :units
    add_foreign_key :special_rules, :troops, on_delete: :nullify

    add_foreign_key :unit_options, :units
    add_foreign_key :unit_options, :unit_options, column: :parent_id
    add_foreign_key :unit_options, :units, column: :mount_id, on_delete: :nullify

    add_foreign_key :army_lists, :armies
    add_foreign_key :army_lists, :users

    add_foreign_key :army_list_units, :army_lists
    add_foreign_key :army_list_units, :units

    add_foreign_key :army_list_units_extra_items, :army_list_units, on_delete: :cascade
    add_foreign_key :army_list_units_extra_items, :extra_items, on_delete: :cascade

    add_foreign_key :army_list_units_magic_items, :army_list_units, on_delete: :cascade
    add_foreign_key :army_list_units_magic_items, :magic_items, on_delete: :cascade

    add_foreign_key :army_list_units_magic_standards, :army_list_units, on_delete: :cascade
    add_foreign_key :army_list_units_magic_standards, :magic_standards, on_delete: :cascade

    execute 'DELETE FROM `army_list_units_unit_options` WHERE `army_list_unit_id` NOT IN (SELECT `id` FROM `army_list_units`)'
    execute 'DELETE FROM `army_list_units_unit_options` WHERE `unit_option_id` NOT IN (SELECT `id` FROM `unit_options`)'

    add_foreign_key :army_list_units_unit_options, :army_list_units, on_delete: :cascade
    add_foreign_key :army_list_units_unit_options, :unit_options, on_delete: :cascade
  end

  def down
    remove_foreign_key :users, column: :favorite_army_id

    remove_foreign_key :extra_item_categories, :armies
    remove_foreign_key :extra_items, :extra_item_categories

    remove_foreign_key :magic_items, :armies
    remove_foreign_key :magic_items, :magic_item_categories
    remove_foreign_key :magic_items, column: :override_id

    remove_foreign_key :magic_standards, :armies
    remove_foreign_key :magic_standards, column: :override_id

    remove_foreign_key :units, :armies
    remove_foreign_key :units, :unit_categories

    remove_foreign_key :troops, :units
    remove_foreign_key :troops, :troop_types
    remove_foreign_key :troops, :unit_options

    remove_foreign_key :equipments, :units
    remove_foreign_key :equipments, :troops

    remove_foreign_key :special_rules, :units
    remove_foreign_key :special_rules, :troops

    remove_foreign_key :unit_options, :units
    remove_foreign_key :unit_options, column: :parent_id
    remove_foreign_key :unit_options, column: :mount_id

    remove_foreign_key :army_lists, :armies
    remove_foreign_key :army_lists, :users

    remove_foreign_key :army_list_units, :army_lists
    remove_foreign_key :army_list_units, :units

    remove_foreign_key :army_list_units_extra_items, :army_list_units
    remove_foreign_key :army_list_units_extra_items, :extra_items

    remove_foreign_key :army_list_units_magic_items, :army_list_units
    remove_foreign_key :army_list_units_magic_items, :magic_items

    remove_foreign_key :army_list_units_magic_standards, :army_list_units
    remove_foreign_key :army_list_units_magic_standards, :magic_standards

    remove_foreign_key :army_list_units_unit_options, :army_list_units
    remove_foreign_key :army_list_units_unit_options, :unit_options
  end
end
