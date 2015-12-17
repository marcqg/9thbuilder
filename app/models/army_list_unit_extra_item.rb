class ArmyListUnitExtraItem < ActiveRecord::Base
  self.table_name = 'army_list_units_extra_items'

  belongs_to :army_list_unit
  belongs_to :extra_item
end
