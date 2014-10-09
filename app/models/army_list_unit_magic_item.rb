class ArmyListUnitMagicItem < ActiveRecord::Base
  self.table_name = 'army_list_units_magic_items'

  belongs_to :army_list_unit
  belongs_to :magic_item
end
