class CreateMagics < ActiveRecord::Migration[5.0]
  def change
    create_table :ninth_age_magics do |t|
      t.belongs_to :version, null: false

      t.timestamps
    end
    add_foreign_key :ninth_age_magics, :ninth_age_versions, column: :version_id

    reversible do |dir|
      dir.up do
        NinthAge::Magic.create_translation_table! :name => :string, :description => :text
      end

      dir.down do
        NinthAge::Magic.drop_translation_table!
      end
    end

    create_table :ninth_age_magic_spells do |t|
      t.belongs_to :magic, null: false
      t.column :type_lvl, :integer, default: 0
      t.column :type_target, :integer, default: 0
      t.column :duration, :integer, default: 0

      t.timestamps
    end
    add_foreign_key :ninth_age_magic_spells, :ninth_age_magics, column: :magic_id

    reversible do |dir|
      dir.up do
        NinthAge::MagicSpell.create_translation_table! :name => :string, :range => :string, :casting_value => :string, :effect => :text
      end

      dir.down do
        NinthAge::MagicSpell.drop_translation_table!
      end
    end

  end
end
