class TranslateArmies < ActiveRecord::Migration
  def self.up
    Army.create_translation_table!({
      :name => :string
    }, {
      :migrate_data => true
    })
  end

  def self.down
    Army.drop_translation_table! :migrate_data => true
  end
end
