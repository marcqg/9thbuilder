class Builder::ArmyListUnitExtraItem < ApplicationRecord
  belongs_to :army_list_unit
  belongs_to :extra_item, :class_name => 'NinthAge::ExtraItem'

  validates :extra_item_id, :army_list_unit_id, presence: true
end
