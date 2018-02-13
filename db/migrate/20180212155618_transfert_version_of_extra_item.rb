class TransfertVersionOfExtraItem < ActiveRecord::Migration[5.0]
  def change

  	remove_foreign_key :ninth_age_extra_items, :ninth_age_versions
  	remove_index :ninth_age_extra_items, name: 'index_ninth_age_extra_items_on_version_id'
  	remove_column :ninth_age_extra_items, :version_id

  	add_column :ninth_age_extra_item_categories, :version_id, :integer, default: nil, null: true
  	NinthAge::ExtraItemCategory.all.each do |extra_item_category|
  		extra_item_category.version_id = extra_item_category.army.version_id
  		extra_item_category.save!
  	end
	  change_column :ninth_age_extra_item_categories, :version_id, :integer, default: nil, null: false
  	add_index :ninth_age_extra_item_categories, :version_id
    add_foreign_key :ninth_age_extra_item_categories, :ninth_age_versions, column: :version_id, on_delete: :cascade


    add_column :ninth_age_armies, :is_official, :boolean, default: false, null: false
    NinthAge::Army.update_all(is_official: true)
  	rename_column :ninth_age_units, :order, :position
  end
end
