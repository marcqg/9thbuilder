class AddLatexKeyMagicItemCategory < ActiveRecord::Migration[5.0]
  def change

  	add_column :ninth_age_magic_item_categories, :latex_key, :string, default: nil, null: true
    add_index :ninth_age_magic_item_categories, [:latex_key], unique: true, name: 'ninth_age_magic_item_categories_version_latex_unique'

    category = NinthAge::MagicItemCategory.find(28)
    category.latex_key = "weaponenchantments"
    category.save!

    category = NinthAge::MagicItemCategory.find(29)
    category.latex_key = "armourenchantments"
    category.save!
    
    category = NinthAge::MagicItemCategory.find(31)
    category.latex_key = "artefacts"
    category.save!
  end
end
