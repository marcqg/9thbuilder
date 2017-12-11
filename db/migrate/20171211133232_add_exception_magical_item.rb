class AddExceptionMagicalItem < ActiveRecord::Migration[5.0]
  def change
  	add_column :ninth_age_armies, :has_default_magic_items, :boolean, :null => false, :default => true

  	NinthAge::Army.where(:id => [3, 18, 34, 5, 20, 36]).update_all(:has_default_magic_items => false)
  end
end
