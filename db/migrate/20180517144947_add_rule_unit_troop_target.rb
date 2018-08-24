class AddRuleUnitTroopTarget < ActiveRecord::Migration[5.0]
  def change

    add_column :ninth_age_equipment_unit_troops, :jet, :string, default: nil, null: true
    add_column :ninth_age_special_rule_unit_troops, :jet, :string, default: nil, null: true

  	NinthAge::SpecialRuleUnitTroop.create_translation_table! :info => :string

    add_foreign_key :ninth_age_special_rule_unit_troop_translations, :ninth_age_special_rule_unit_troops, column: "ninth_age_special_rule_unit_troop_id"
  end
end
