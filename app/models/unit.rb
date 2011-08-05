class Unit < ActiveRecord::Base
  belongs_to :army
  belongs_to :unit_category
  has_many :army_list_choices, :dependent => :destroy
  has_many :equipments, :order => 'position', :dependent => :destroy
  has_many :special_rules, :order => 'position', :dependent => :destroy
  has_many :troops, :order => 'position', :dependent => :destroy
  has_many :unit_options, :order => ['parent_id', 'position'], :dependent => :destroy

  validates_presence_of :army_id, :unit_category_id, :name, :min_size
  validates_numericality_of :min_size, :greater_than_or_equal_to => 1
  validates_numericality_of :max_size, :greater_than_or_equal_to => :min_size, :allow_nil => true
  validates_numericality_of :value_points, :greater_than_or_equal_to => 0, :allow_nil => true

  default_scope order('name')
end
