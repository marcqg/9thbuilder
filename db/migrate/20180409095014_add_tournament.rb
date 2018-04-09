class AddTournament < ActiveRecord::Migration[5.0]
  def change

  	create_table :tournament_tournaments, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
	  t.integer "creator_id", 			default: 0,     null: false
	  t.string  "name",     null: false
	  t.string  "address",     null: false
	  t.decimal "latitude",     null: false, precision: 10, scale: 5
	  t.decimal "longitude",     null: false, precision: 10, scale: 5
	  t.datetime "start_date",     null: false
	  t.datetime "end_date",     null: false
	  t.decimal  "fees", precision: 10, scale: 2
      t.datetime "created_at"
      t.datetime "updated_at"
      t.index ["creator_id"], name: "index_tournament_tournaments_on_creator_id", using: :btree
	end
  end
end
