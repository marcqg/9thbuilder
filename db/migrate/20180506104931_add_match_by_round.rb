class AddMatchByRound < ActiveRecord::Migration[5.0]
  def change

	create_table :tournament_matches, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
	  t.integer "round_id", 		 	default: 0,    null: false
	  t.integer "position",      default: 0,     null: false
    t.integer "user_apply_one_id", 		default: 0,   	null: false
	  t.integer "user_apply_two_id", 		default: 0,   	null: false
	  t.integer "user_apply_one_points", 		 		default: 0,   	null: false
	  t.integer "user_apply_two_points", 		 		default: 0,   	null: false
	  t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["round_id"], name: "index_tournament_user_applies_on_round_id", using: :btree
    t.index ["table"], name: "index_tournament_user_applies_on_table", using: :btree
    t.index ["user_apply_one_id"], name: "index_tournament_user_applies_on_user_apply_one_id", using: :btree
    t.index ["user_apply_two_id"], name: "index_tournament_user_applies_on_user_apply_two_id", using: :btree
	end

   	add_foreign_key :tournament_matchs, :tournament_events, column: "round_id"
   	add_foreign_key :tournament_matchs, :tournament_user_applies, column: "user_apply_one_id"
   	add_foreign_key :tournament_matchs, :tournament_user_applies, column: "user_apply_two_id"


  	add_column :tournament_rounds, :finish, :boolean, default: false, null: false
  end
end
