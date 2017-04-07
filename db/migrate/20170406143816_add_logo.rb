class AddLogo < ActiveRecord::Migration[5.0]
  def change
    add_attachment :armies, :logo
    add_attachment :ninth_age_magics, :logo
    add_attachment :ninth_age_organisations, :logo
  end
end
