class ExtraItem < ActiveRecord::Base
  belongs_to :extra_item_category
  has_many :army_list_unit_extra_items, dependent: :destroy
  has_many :army_list_units, through: :army_list_unit_extra_items

  validates_presence_of :extra_item_category_id, :name, :value_points
  validates_numericality_of :value_points, greater_than_or_equal_to: 0

  scope :available_for, lambda { |extra_item_category, value_points_limit|
    if value_points_limit.nil?
      where(extra_item_category_id: extra_item_category).order('value_points DESC', 'name')
    else
      where(extra_item_category_id: extra_item_category).where('value_points <= ?', value_points_limit).order('value_points DESC', 'name')
    end
  }
end
