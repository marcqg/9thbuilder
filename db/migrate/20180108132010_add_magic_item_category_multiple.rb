class AddMagicItemCategoryMultiple < ActiveRecord::Migration[5.0]
  def change
  	add_column :ninth_age_magic_item_categories, :is_multiple, :boolean, :null => false, :default => false

  	category = NinthAge::MagicItemCategory.find(3)
  	category.is_multiple = true
  	category.save
  end
end
