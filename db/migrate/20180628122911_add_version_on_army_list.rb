class AddVersionOnArmyList < ActiveRecord::Migration[5.0]
  def change
    add_column :builder_army_lists, :version_id, :integer, default: nil, null: true
    add_foreign_key :builder_army_lists, :ninth_age_versions, column: "version_id"
    add_index :builder_army_lists, [:version_id], name: 'builder_army_lists_version'

    ActiveRecord::Base.connection.execute("UPDATE builder_army_lists al
      INNER JOIN ninth_age_armies a ON a.id = al.army_id
      SET al.version_id = a.version_id;")

    change_column :builder_army_lists, :version_id, :integer, default: nil, null: false
  end
end
