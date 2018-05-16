class AddPwl < ActiveRecord::Migration[5.0]
  def change

  	create_table :tournament_custom_points, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
  	  t.integer "event_id", 		 	default: 0,    	null: false
  	  t.integer "user_apply_id", 		default: 0,   	null: false
  	  t.integer "paint_points", 		default: 0,   	null: false
  	  t.integer "wysiwyg_points", 		default: 0,   	null: false
  	  t.integer "list_points", 		 	default: 0,   	null: false
  	  t.integer "total_points", 		default: 0,   	null: false
  	  t.datetime "created_at"
      t.datetime "updated_at"
      t.index ["event_id"], name: "index_tournament_pwls_on_round_id", using: :btree
      t.index ["user_apply_id"], name: "index_tournament_pwls_on_user_apply_one_id", using: :btree
  	end
  
    add_foreign_key :tournament_custom_points, :tournament_events, column: "event_id"
    add_foreign_key :tournament_custom_points, :tournament_user_applies, column: "user_apply_id"
  end
end
