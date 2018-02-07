class AddOrganisationToMagicStandard < ActiveRecord::Migration[5.0]
  def change
    
    add_column :ninth_age_magic_standards, :organisation_id, :integer, default: nil, null: true

    add_index :ninth_age_magic_standards,  :organisation_id, :name => 'index_ninth_age_magic_standards_on_organisation_id'
    add_foreign_key :ninth_age_magic_standards, :ninth_age_organisations, column: :organisation_id, on_delete: :cascade


    NinthAge::MagicItem.add_translation_fields! infos: :text    
    NinthAge::MagicStandard.add_translation_fields! infos: :text
  end
end
