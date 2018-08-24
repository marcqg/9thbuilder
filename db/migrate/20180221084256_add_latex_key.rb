class AddLatexKey < ActiveRecord::Migration[5.0]
  def change

  	add_column :ninth_age_special_rules, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_special_rules, [:version_id, :latex_key], unique: true, name: 'ninth_age_special_rules_version_latex_unique'

  	add_column :ninth_age_equipments, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_equipments, [:version_id, :latex_key], unique: true, name: 'ninth_age_equipments_version_latex_unique'
  	
    add_column :ninth_age_units, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_units, [:army_id, :latex_key], unique: true, name: 'ninth_age_units_army_latex_unique'
  	
    add_column :ninth_age_troops, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_troops, [:unit_id, :latex_key], unique: true, name: 'ninth_age_troops_unit_latex_unique'
  	

    add_column :ninth_age_armies, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_armies, [:version_id, :latex_key], unique: true, name: 'ninth_age_armies_version_latex_unique'

  	
    
    add_column :ninth_age_extra_items, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_extra_items, [:extra_item_category_id, :latex_key], unique: true, name: 'ninth_age_extra_items_extra_item_category_latex_unique'
  	

    add_column :ninth_age_magic_items, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_magic_items, [:version_id, :latex_key], unique: true, name: 'ninth_age_magic_items_version_latex_unique'
  	

    add_column :ninth_age_magic_standards, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_magic_standards, [:version_id, :latex_key], unique: true, name: 'ninth_age_magic_standards_version_latex_unique'

  	

    add_column :ninth_age_domain_magics, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_domain_magics, [:version_id, :latex_key], unique: true, name: 'ninth_age_domain_magics_version_latex_unique'
  	

    add_column :ninth_age_domain_magic_spells, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_domain_magic_spells, [:domain_magic_id, :latex_key], unique: true, name: 'ninth_age_domain_magic_spells_domain_magic_latex_unique'
  end
end
