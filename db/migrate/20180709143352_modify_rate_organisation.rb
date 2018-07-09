class ModifyRateOrganisation < ActiveRecord::Migration[5.0]
  def change
    add_column :builder_army_lists, :rate_with_max, :boolean, default: false, null: false
    change_column :builder_army_list_organisations, :rate, :decimal, :precision => 5, :scale => 2
  end
end
