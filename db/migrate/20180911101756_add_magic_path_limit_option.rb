class AddMagicPathLimitOption < ActiveRecord::Migration[5.0]
  def change
    add_column :ninth_age_magic_items, :disable_magic_path_limit, :boolean, default: false, null: false
  end
end
