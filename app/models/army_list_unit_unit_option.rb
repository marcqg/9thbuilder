class ArmyListUnitUnitOption < ApplicationRecord
  self.table_name = 'army_list_units_unit_options'

  belongs_to :army_list_unit
  belongs_to :unit_option, :class_name => 'NinthAge::UnitOption'
end
