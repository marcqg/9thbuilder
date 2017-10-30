class AddMaxArmyList < ActiveRecord::Migration[5.0]
  def change
    add_column :builder_army_lists, :max, :integer, :default => 0, :null => false

    Builder::ArmyList.update_all("max = value_points")
  end
end
