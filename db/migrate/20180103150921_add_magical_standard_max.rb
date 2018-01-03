class AddMagicalStandardMax < ActiveRecord::Migration[5.0]
  def change
  	add_column :ninth_age_magic_standards, :max, :integer, :null => false, :default => 0
  end
end
