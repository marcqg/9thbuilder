class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :provider, :string, :default => 'email', :null => false
    add_column :users, :uid, :string, :default => '', :null => false
    add_column :users, :tokens, :text

    User.update_all("uid = email")

    add_index :users, [:uid, :provider],     unique: true
  end
end
