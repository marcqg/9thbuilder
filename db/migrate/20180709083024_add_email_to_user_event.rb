class AddEmailToUserEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :tournament_user_applies, :email, :string, default: nil, null: true
  end
end
