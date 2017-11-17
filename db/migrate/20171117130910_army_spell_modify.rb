class ArmySpellModify < ActiveRecord::Migration[5.0]
  def change
    remove_column :ninth_age_army_magic_spells, :type_lvl
    NinthAge::ArmyMagicSpell.add_translation_fields! :description => :text
  end
end
