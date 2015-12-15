class AddUuidArmyList < ActiveRecord::Migration
  def change
    add_column :army_lists, :uuid, :string, limit: 36, null: false
  end
end
