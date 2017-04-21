class ModifyNamespace < ActiveRecord::Migration[5.0]
  def change
    add_column :special_rule_translations, :description, :text, :null => true

    rename_table :special_rules, :ninth_age_special_rules
    rename_table :special_rule_translations, :ninth_age_special_rule_translations
  end
end
