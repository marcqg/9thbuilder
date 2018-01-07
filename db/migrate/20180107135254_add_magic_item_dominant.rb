class AddMagicItemDominant < ActiveRecord::Migration[5.0]
  def change
  	add_column :ninth_age_magic_items, :is_dominant, :boolean, :null => false, :default => false
  end
end
