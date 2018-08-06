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

    create_table "tournament_teams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
      t.integer "event_id",         default: 0, null: false
      t.integer "leader_id",        default: 0, null: false
      t.string "leader_name",       default: nil, null: false
      t.string "leader_email",      default: nil, null: false
      t.string "name",              default: nil, null: false
      t.integer "position",         default: 0, null: false

      t.index ["event_id", "position"], name: "tournament_teams_event_position", unique: true, using: :btree
      t.index ["leader_id"], name: "tournament_teams_leader_id", using: :btree
    end
    add_foreign_key :tournament_teams, :tournament_events, column: "event_id"
    add_foreign_key :tournament_teams, :users, column: "leader_id"
  end
end
