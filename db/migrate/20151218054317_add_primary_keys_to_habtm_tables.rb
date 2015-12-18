class AddPrimaryKeysToHabtmTables < ActiveRecord::Migration
  def change
    add_column :army_list_units_extra_items, :id, :primary_key
    add_column :army_list_units_magic_standards, :id, :primary_key
  end
end
