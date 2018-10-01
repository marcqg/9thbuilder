class AddTeam < ActiveRecord::Migration[5.0]
  def change
    
    add_column :tournament_events, :team_max, :integer, default: 0, null: false
    add_column :tournament_events, :participation, :integer, default: 1, null: false

    add_column :tournament_events, :uuid, :string, length: 36, default: nil, null: true
    Tournament::Event.all.each do |event|
      event.uuid = UUIDTools::UUID.random_create.to_s
      event.save!
    end
    change_column :tournament_events, :uuid, :string, length: 36, default: nil, null: false
    add_index :tournament_events, :uuid, unique: true, name: 'tournament_events_uuid_unique'

    create_table "tournament_teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.integer "event_id",         default: 0, null: false
      t.string "name",              default: nil, null: false
      t.integer "position",         default: 0, null: false

      t.index ["event_id", "position"], name: "tournament_teams_event_position", unique: true, using: :btree
    end
    add_foreign_key :tournament_teams, :tournament_events, column: "event_id"    
    
    add_column :tournament_user_applies, :team_id, :integer, default: nil, null: true
    add_column :tournament_user_applies, :team_leader, :boolean, default: nil, null: true
    add_foreign_key :tournament_user_applies, :tournament_teams, column: "team_id"
    add_index :tournament_user_applies, :team_id, name: 'tournament_user_applies_team_id'
    
    add_column :tournament_teams, :invitation_token, :string, length: 36, default: nil, null: true
    add_column :tournament_teams, :invitation_enabled, :boolean, default: false, null: false
  end
end
