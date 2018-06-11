class AddRuleCategoryAndOptionMagic < ActiveRecord::Migration[5.0]
  def change
    add_column :ninth_age_special_rules, :effect, :integer, default: 0, null: false
  end
end
