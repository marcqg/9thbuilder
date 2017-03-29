class ArmyListUnitMagicStandard < ApplicationRecord
  self.table_name = 'army_list_units_magic_standards'

  belongs_to :army_list_unit
  belongs_to :magic_standard
end
