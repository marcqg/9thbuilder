class RefactoBddConstraints < ActiveRecord::Migration[5.0]
  def change

  	NinthAge::Unit.where(:min_size => nil).update_all(:min_size => 1)
  	NinthAge::Unit.where(:min_size => 0).update_all(:min_size => 1)

  	NinthAge::Unit.where(:max_size => nil).update_all(:max_size => 1)
  	NinthAge::Unit.where(:max_size => 0).update_all(:max_size => 1)

  	NinthAge::Unit.where(:max => nil).update_all(:max => 0)
  	NinthAge::Unit.where(:value_points => nil).update_all(:value_points => 0)

    NinthAge::EquipmentUnitTroop.where(:position => 0).update_all(:position => 1)
    NinthAge::SpecialRuleUnitTroop.where(:position => 0).update_all(:position => 1)
    NinthAge::Unit.where(:position => 0).update_all(:position => 1)

    ActiveRecord::Base.connection.execute('UPDATE ninth_age_troops t
     INNER JOIN ninth_age_units u on t.unit_id = u.id
    SET t.type_carac = 1
    where t.type_carac = 0 and t.troop_type_id is null and u.type_carac = 1 and t.id > 0;')


  	change_column :ninth_age_units, :min_size, :integer, default: 1, null: false
  	change_column :ninth_age_units, :max_size, :integer, default: 1, null: false
  	change_column :ninth_age_units, :max, :integer, default: 0, null: false
  	change_column :ninth_age_units, :value_points, :integer, default: 0, null: false

    change_column :ninth_age_equipment_unit_troops, :position, :integer, default: 1, null: false
    change_column :ninth_age_special_rule_unit_troops, :position, :integer, default: 1, null: false  	
  end
end
