class AddVersionToTournamentEvent < ActiveRecord::Migration[5.0]
  def change
  	add_column :tournament_events, :version_id, :integer, default: 0, null: true

  	Tournament::Event.update_all(:version_id => NinthAge::Version.last.id)

  	change_column :tournament_events, :version_id, :integer, default: 0, null: false

    add_index :tournament_events, [:version_id], name: 'tournament_events_version_id'

   	add_foreign_key :tournament_events, :ninth_age_versions, column: "version_id"

	create_table :tournament_rounds, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
	  t.integer "event_id", 		 default: 0,    null: false
	  t.integer "position", 		 default: 0,   	null: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.index ["event_id"], name: "index_tournament_user_applies_on_event_id", using: :btree
	end

   	add_foreign_key :tournament_rounds, :tournament_events, column: "event_id"

  end
end
