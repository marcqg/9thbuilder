class AddInfoToUnitEquipment < ActiveRecord::Migration[5.0]
  def change

  	NinthAge::EquipmentUnitTroop.create_translation_table! :info => :string

    add_foreign_key :ninth_age_equipment_unit_troop_translations, :ninth_age_equipment_unit_troops, column: "ninth_age_equipment_unit_troop_id"

    NinthAge::Equipment.joins(:translations)
    					.where(:version => 3)
                        .with_locales(I18n.locale)
    					.where('name like "%(%)"')
    					.each do |equipment|

    	p "#{equipment.name}(#{equipment.id})"

    	name = equipment.name.gsub(/\(.*\)/, "").strip
    	p name
    	info = equipment.name.match(/\((.*)\)/i)[1].strip
    	p info

    	origin_equipment = NinthAge::Equipment.find_by({name: name, :version => 3})

    	if origin_equipment.nil?
    		next
    	end

    	p "Replace Equipment #{equipment.name}(#{equipment.id}) => #{origin_equipment.name}(#{origin_equipment.id})"

    	equipment.equipment_unit_troops.each do |equipment_unit_troop|
    		equipment_unit_troop.equipment = origin_equipment
    		equipment_unit_troop.info = info
    		equipment_unit_troop.save!
    	end

    	equipment.destroy!

    end
  end
end
