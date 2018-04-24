class AddTournamentApply < ActiveRecord::Migration[5.0]
  def change

    drop_table "tournament_tournaments"

    create_table :tournament_events, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.integer "creator_id",       default: 0,     null: false
      t.string  "name",     null: false
      t.string  "address",     null: false
      t.decimal "latitude",     null: false, precision: 10, scale: 5
      t.decimal "longitude",     null: false, precision: 10, scale: 5
      t.datetime "start_date",     null: false
      t.datetime "end_date",     null: false
      t.decimal  "fees", precision: 10, scale: 2
      t.string "source", null: true
      t.datetime "created_at"
      t.datetime "updated_at"
      t.index ["creator_id"], name: "index_tournament_tournaments_on_creator_id", using: :btree
    end

  	create_table :tournament_user_applies, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
	    t.integer "event_id", 			default: 0,     null: false
	    t.integer "user_id", 					default: nil,     null: true
      t.integer "army_id",       default: 0,     null: false
      t.integer "army_list_id",       default: nil,     null: true
	    t.integer  "state", 					default: 0,     null: false
      t.string    "name",           null: true
      t.datetime "created_at"
      t.datetime "updated_at"
      t.index ["event_id"], name: "index_tournament_user_applies_on_event_id", using: :btree
      t.index ["user_id"], name: "index_tournament_user_applies_on_user_id", using: :btree
      t.index ["army_id"], name: "index_tournament_user_applies_on_army_id", using: :btree
      t.index ["army_list_id"], name: "index_tournament_user_applies_on_army_list_id", using: :btree
	  end

   	add_foreign_key :tournament_events, :users, column: "creator_id"
    add_foreign_key :tournament_user_applies, :tournament_events, column: "event_id"
    add_foreign_key :tournament_user_applies, :users, column: "user_id"
    add_foreign_key :tournament_user_applies, :ninth_age_armies, column: "army_id"
   	add_foreign_key :tournament_user_applies, :builder_army_lists, column: "army_list_id"


  	add_column :users, :latitude, :decimal, precision: 11, scale: 8, null: true
  	add_column :users, :longitude, :decimal, precision: 11, scale: 8, null: true

    Role.new({name: 'organisator'})

  end
end
