class AddUnitOptionCategory < ActiveRecord::Migration[5.0]
  def change

  	add_column :ninth_age_unit_options, :category, :integer, default: 0, null: true

  	NinthAge::UnitOption.where.not(mount_id: nil).update_all(category: :Mount)
  	NinthAge::UnitOption.where.not(domain_magic_id: nil).update_all(category: :MagicPath)

  	NinthAge::UnitOption.where(is_magic_items: true).update_all(category: :MagicEquipment)
  	NinthAge::UnitOption.where(is_magic_standards: true).update_all(category: :MagicBanner)


  	NinthAge::UnitOption.joins(:translations).where("name like ?", "%Musician%").update_all(category: :M)
  	NinthAge::UnitOption.joins(:translations).where("name like ?", "%Standard%").update_all(category: :S)
    NinthAge::UnitOption.joins(:translations).where("name like ?", "%Champion%").update_all(category: :C)
    NinthAge::UnitOption.joins(:translations).where("name like ?", "%Battle Standard Bearer%").update_all(category: :BSB)
    NinthAge::UnitOption.joins(:translations).where("name like ?", "%Wizard%").update_all(category: :MagicOrLine)
  	  	
  	change_column :ninth_age_unit_options, :category, :integer, default: 0, null: false
  end
end
