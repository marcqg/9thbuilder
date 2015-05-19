class AddMultipleUnitOptions < ActiveRecord::Migration
  def up
    add_column :unit_options, :is_multiple, :boolean, :default => false, :null => false
    add_column :army_list_units_unit_options, :id, :primary_key
    add_column :army_list_units_unit_options, :quantity, :integer, :default => 1, :null => false

    UnitOption.reset_column_information
    ArmyListUnitUnitOption.reset_column_information

    ArmyListUnit.all.each do |alu|
      alu.army_list_unit_unit_options.each do |aluuo|
        if aluuo.unit_option.try(:is_per_model)
          ArmyListUnitUnitOption.where('army_list_unit_id = ? AND unit_option_id = ?', alu.id, aluuo.unit_option.id).update_all(:quantity => alu.army_list_unit_troops.first.size.to_i)
        end
      end

      say "Unit #{alu.unit.name} unit option's updated!"
    end
  end

  def down
    remove_column :unit_options, :is_multiple
    remove_column :army_list_units_unit_options, :id, :quantity
  end
end
