class AddExtraItemByUnitOptions < ActiveRecord::Migration[5.0]
  def change

    create_table "ninth_age_extra_item_categories_unit_options", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.integer "unit_option_id",         default: 0, null: false
      t.integer "extra_item_category_id", default: 0, null: false
      t.index ["extra_item_category_id", "unit_option_id"], name: "ninth_age_units_organisations_extra_item_category_unit_option", unique: true, using: :btree
      t.index ["unit_option_id", "extra_item_category_id"], name: "ninth_age_units_organisations_unit_option_extra_item_category", unique: true, using: :btree
    end

  end
end
