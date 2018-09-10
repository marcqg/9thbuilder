class AddMagicItemFactor < ActiveRecord::Migration[5.0]
  def change
    add_column :ninth_age_unit_options, :magic_item_factor, :integer, default: 1, null: false
  end
end
