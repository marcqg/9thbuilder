class CreateMagics < ActiveRecord::Migration[5.0]
  def change
    create_table :ninth_age_magics do |t|
      t.belongs_to :version, null: false

      t.timestamps
    end
    add_foreign_key :ninth_age_magics, :ninth_age_versions, column: :version_id

    NinthAge::Magic.create_translation_table! :name => :string, :description => :text
    add_foreign_key :ninth_age_magic_translations, :ninth_age_magics, column: :ninth_age_magic_id, on_delete: :cascade

    create_table :ninth_age_magic_spells do |t|
      t.belongs_to :magic, null: false
      t.column :type_lvl, :integer, default: 0
      t.column :type_target, :integer, default: 0
      t.column :duration, :integer, default: 0

      t.timestamps
    end
    add_foreign_key :ninth_age_magic_spells, :ninth_age_magics, column: :magic_id

    NinthAge::MagicSpell.create_translation_table! :name => :string, :range => :string, :casting_value => :string, :effect => :text
    add_foreign_key :ninth_age_magic_spell_translations, :ninth_age_magic_spells, column: :ninth_age_magic_spell_id, on_delete: :cascade

    add_attachment :armies, :logo
    add_attachment :ninth_age_magics, :logo
  end
end
