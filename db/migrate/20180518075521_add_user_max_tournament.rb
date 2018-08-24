class AddUserMaxTournament < ActiveRecord::Migration[5.0]
  def change

    add_column :tournament_events, :user_max, :integer, default: 0, null: false
  end
end
