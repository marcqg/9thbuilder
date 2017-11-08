class AddUnitTypeTranslation < ActiveRecord::Migration[5.0]
  def change



    NinthAge::UnitType.create_translation_table! :name => :string
    add_foreign_key :ninth_age_unit_type_translations, :ninth_age_unit_types, column: :ninth_age_unit_type_id, on_delete: :cascade

    ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_unit_types (id, created_at, updated_at)
											SELECT id, NOW(), NOW()
											FROM ninth_age_troop_types;')

	ActiveRecord::Base.connection.execute('INSERT INTO ninth_age_unit_type_translations (id, ninth_age_unit_type_id, locale, created_at, updated_at, name)
												SELECT id, ninth_age_troop_type_id, locale, NOW(), NOW(), name
												FROM ninth_age_troop_type_translations;')
  end
end
