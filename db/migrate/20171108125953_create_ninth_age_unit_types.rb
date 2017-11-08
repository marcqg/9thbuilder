class CreateNinthAgeUnitTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :ninth_age_unit_types do |t|

      t.timestamps
    end


    add_column :ninth_age_units, :unit_type_id, :integer, :null => true
    add_foreign_key :ninth_age_units, :ninth_age_unit_types, column: :unit_type_id, on_delete: :cascade
  end
end
