class Builder::ArmyListUnitMagicItem < ApplicationRecord
  belongs_to :army_list_unit
  belongs_to :magic_item, :class_name => 'NinthAge::MagicItem'

  validates :magic_item_id, :army_list_unit_id, presence: true
end
