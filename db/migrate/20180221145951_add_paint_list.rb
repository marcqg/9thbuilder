class AddPaintList < ActiveRecord::Migration[5.0]
  def change

  	create_table :paint_paint_lists, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
	  t.integer "army_id",    		default: 0,     null: false
	  t.integer "user_id", 			default: 0,     null: false
	  t.string  "name",								null: false
      t.index ["army_id"], name: "index_builder_army_lists_on_army_id", using: :btree
      t.index ["user_id"], name: "index_builder_army_lists_on_user_id", using: :btree
	end

    add_foreign_key :paint_paint_lists, :ninth_age_armies, column: "army_id"
    add_foreign_key :paint_paint_lists, :users, column: "user_id"

    create_table "paint_paint_list_units", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
      t.integer  "paint_list_id"
      t.integer  "unit_id"
      t.integer  "position"
      t.integer  "size"
      t.integer  "step"
      t.integer  "state"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.index ["paint_list_id"], name: "index_paint_paint_list_units_on_paint_list_id", using: :btree
      t.index ["unit_id"], name: "index_paint_paint_list_units_on_unit_id", using: :btree
    end

   	add_foreign_key :paint_paint_list_units, :paint_paint_lists, column: "paint_list_id"
   	add_foreign_key :paint_paint_list_units, :ninth_age_units, column: "unit_id"

  end
end
