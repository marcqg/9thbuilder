class RolifyCreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:users_roles, :id => false) do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
    end

    add_index(:roles, :name)
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:users_roles, [ :user_id, :role_id ])

    Role.create :name => 'Administrator'
    Role.create :name => 'Moderator'

    execute 'INSERT INTO users (`email`, `encrypted_password`,`reset_password_token`, `reset_password_sent_at`, `remember_created_at`,`sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`,`created_at`,`updated_at`)
              SELECT `email`, `encrypted_password`,`reset_password_token`, `reset_password_sent_at`, `remember_created_at`,`sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`,`created_at`,`updated_at`
              FROM `admin_users`
              WHERE `email` NOT IN (SELECT `email` FROM users)'

    execute 'INSERT INTO users_roles (user_Id, role_id)
              SELECT id, 1
              FROM users
              WHERE `email` IN (SELECT `email` FROM admin_users)'

    drop_table :admin_users

  end
end
