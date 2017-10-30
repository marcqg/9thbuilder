class AddLogoLargeArmy < ActiveRecord::Migration[5.0]
  def change
    add_attachment :ninth_age_armies, :logo_large
  end
end
