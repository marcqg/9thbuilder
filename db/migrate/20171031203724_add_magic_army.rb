class AddMagicArmy < ActiveRecord::Migration[5.0]
  def change


    remove_foreign_key :ninth_age_magic_translations, name: :fk_rails_a14a9a3105
    remove_index :ninth_age_magic_translations,  :ninth_age_magic_id

    rename_table :ninth_age_magics, :ninth_age_domain_magics
    rename_table :ninth_age_magic_translations, :ninth_age_domain_magic_translations
    rename_column :ninth_age_domain_magic_translations, :ninth_age_magic_id, :ninth_age_domain_magic_id

    add_index :ninth_age_domain_magic_translations,  :ninth_age_domain_magic_id, :name => 'index_ninth_age_domain_magic_translations_on_magic_id'
    add_foreign_key :ninth_age_domain_magic_translations, :ninth_age_domain_magics, column: :ninth_age_domain_magic_id, on_delete: :cascade

    remove_foreign_key :ninth_age_magic_spell_translations, name: :fk_rails_9020067c9b
    remove_index :ninth_age_magic_spell_translations,  :ninth_age_magic_spell_id

    rename_table :ninth_age_magic_spells, :ninth_age_domain_magic_spells
    rename_column :ninth_age_domain_magic_spells, :magic_id, :domain_magic_id

    rename_table :ninth_age_magic_spell_translations, :ninth_age_domain_magic_spell_translations
    rename_column :ninth_age_domain_magic_spell_translations, :ninth_age_magic_spell_id, :ninth_age_domain_magic_spell_id
    
    add_index :ninth_age_domain_magic_spell_translations,  :ninth_age_domain_magic_spell_id, :name => 'index_ninth_age_domain_magic_translations_on_magic_id'
    add_foreign_key :ninth_age_domain_magic_spell_translations, :ninth_age_domain_magic_spells, column: :ninth_age_domain_magic_spell_id, on_delete: :cascade


    create_table :ninth_age_army_magic_spells do |t|
      t.belongs_to :army, index: false, null: false, default: 0
      t.integer  :type_lvl,    default: 0, null: false
      t.integer  :type_target, default: 0, null: false
      t.integer  :duration,    default: 0, null: false

      t.timestamps
    end
    add_foreign_key :ninth_age_army_magic_spells, :ninth_age_armies, column: :army_id

    NinthAge::ArmyMagicSpell.create_translation_table! :name => :string, :range => :string, :casting_value => :string, :effect => :text
    add_foreign_key :ninth_age_army_magic_spell_translations, :ninth_age_army_magic_spells, column: :ninth_age_army_magic_spell_id, on_delete: :cascade

    add_column :ninth_age_equipments, :type_lvl, :integer, default: 0, null: false
    add_column :ninth_age_special_rules, :type_lvl, :integer, default: 0, null: false

    add_column :ninth_age_units, :size, :integer, default: 0, null: false
    add_column :ninth_age_units, :type_carac, :integer, default: 0, null: false

    add_column :ninth_age_units, :carac_ground_adv, :string, default: nil, null: true
    add_column :ninth_age_units, :carac_ground_mar, :string, default: nil, null: true
    add_column :ninth_age_units, :carac_fly_adv, :string, default: nil, null: true
    add_column :ninth_age_units, :carac_fly_mar, :string, default: nil, null: true
    add_column :ninth_age_units, :carac_dis, :string, default: nil, null: true
    add_column :ninth_age_units, :carac_evoked, :string, default: nil, null: true

    add_column :ninth_age_units, :carac_hp, :string, default: nil, null: true
    add_column :ninth_age_units, :carac_def, :string, default: nil, null: true
    add_column :ninth_age_units, :carac_res, :string, default: nil, null: true
    add_column :ninth_age_units, :carac_as, :string, default: nil, null: true
    add_column :ninth_age_units, :carac_spe, :string, default: nil, null: true

    add_column :ninth_age_troops, :type_carac, :integer, default: 0, null: false

    add_column :ninth_age_troops, :carac_att, :string, default: nil, null: true
    add_column :ninth_age_troops, :carac_of, :string, default: nil, null: true
    add_column :ninth_age_troops, :carac_str, :string, default: nil, null: true
    add_column :ninth_age_troops, :carac_ap, :string, default: nil, null: true
    add_column :ninth_age_troops, :carac_agi, :string, default: nil, null: true

  end
end
