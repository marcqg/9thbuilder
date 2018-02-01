class AddUnitLinkOnUnitOption < ActiveRecord::Migration[5.0]
  def change
    add_column :ninth_age_unit_options, :unit_link_id, :integer, default: nil, null: true

    add_index :ninth_age_unit_options,  :unit_link_id, :name => 'index_ninth_age_unit_options_on_unit_link_id'
    add_foreign_key :ninth_age_unit_options, :ninth_age_units, column: :unit_link_id, on_delete: :cascade
  end
end
