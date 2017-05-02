class Builder::ArmyListUnitUnitOption < ApplicationRecord
  belongs_to :army_list_unit
  belongs_to :unit_option, :class_name => 'NinthAge::UnitOption'
end
