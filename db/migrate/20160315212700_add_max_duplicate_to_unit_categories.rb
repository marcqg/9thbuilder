class AddMaxDuplicateToUnitCategories < ActiveRecord::Migration
  def change
    add_column :unit_categories, :warband_max_duplicate, :integer
    add_column :unit_categories, :army_max_duplicate, :integer
    add_column :unit_categories, :grand_army_max_duplicate, :integer
  end
end
