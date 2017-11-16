class ChangeOptionMagic < ActiveRecord::Migration[5.0]
  def change

    rename_column :ninth_age_unit_options, :magic_id, :domain_magic_id

    add_index :ninth_age_unit_options,  :domain_magic_id, :name => 'index_ninth_age_options_on_magic_id'
    add_foreign_key :ninth_age_unit_options, :ninth_age_domain_magics, column: :domain_magic_id, on_delete: :cascade

  end
end
