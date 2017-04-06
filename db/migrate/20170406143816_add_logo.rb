class AddLogo < ActiveRecord::Migration[5.0]
  def change
    add_attachment :armies, :logo
  end
end
