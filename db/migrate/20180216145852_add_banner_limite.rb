class AddBannerLimite < ActiveRecord::Migration[5.0]
  def change
  	remove_column :ninth_age_units, :carac_as
  	remove_column :ninth_age_units, :carac_spe

  	add_column :ninth_age_unit_options, :banner_limit, :integer, default: 0, null: false
  end
end
