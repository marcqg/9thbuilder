class AddOrganisationLatexKey < ActiveRecord::Migration[5.0]
  def change
  	add_column :ninth_age_organisations, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_organisations, [:army_id, :latex_key], unique: true, name: 'ninth_age_organisations_army_latex_unique'

    NinthAge::UnitOption.where.not(mount_id: nil).update_all(category: :Mount)
  end
end
