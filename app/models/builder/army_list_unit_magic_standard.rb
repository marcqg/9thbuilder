class Builder::ArmyListUnitMagicStandard < ApplicationRecord
  belongs_to :army_list_unit
  belongs_to :magic_standard, :class_name => 'NinthAge::MagicStandard'
end
