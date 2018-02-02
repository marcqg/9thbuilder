class AddExtraItemConfiguration < ActiveRecord::Migration[5.0]
  def change
    add_column :ninth_age_unit_options, :has_one_choise, :boolean, default: false, null: false
    NinthAge::UnitOption.where("name LIKE '%(one choice only)%'").update_all(:has_one_choise => true)
    NinthAge::UnitOption.where("name LIKE '%(choose one)%'").update_all(:has_one_choise => true)

    add_column :ninth_age_extra_item_categories, :is_unique, :boolean, default: false, null: false
    
    add_column :ninth_age_extra_items, :extra_item_activator_id, :integer, default: nil, null: true

    add_index :ninth_age_extra_items,  :extra_item_activator_id, :name => 'index_ninth_age_extra_items_on_extra_item_activator_id'
    add_foreign_key :ninth_age_extra_items, :ninth_age_extra_items, column: :extra_item_activator_id, on_delete: :cascade
  end
end
