class OptionAddMountAndCaractereForPoints < ActiveRecord::Migration[5.0]
  def change
    add_column :ninth_age_unit_options, :mount_and_carac_points, :boolean, default: false, null: false
  end
end
