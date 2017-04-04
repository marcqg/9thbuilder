class CreateVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :versions do |t|
      t.integer :major, null: false, default: 0
      t.integer :minor, null: false, default: 0
      t.integer :fix, null: false, default: 0
      t.boolean :public, null: false, default: false

      t.timestamps
    end

    Version.create_translation_table!({ :name => :string })

    Version.create :name => 'V-1.0.0', :major => 1, :minor => 0, :fix => 0, :public => true

    add_column :armies, :version_id, :integer, :default => 0, :null => true
    add_index :armies, :version_id

    Army.update_all(version_id: 1)

    add_foreign_key :armies, :versions, column: :version_id, on_delete: :cascade

  end
end
