class AddUnitFieldArm < ActiveRecord::Migration[5.0]
  def change
    add_column :ninth_age_units, :carac_arm, :string, default: nil, null: true
  end
end
