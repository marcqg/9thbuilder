class Paint::PaintListUnit < ApplicationRecord

  belongs_to :paint_list
  belongs_to :unit, :class_name => 'NinthAge::Unit'

  enum step: { nothing: 0, buy: 1, trimmed: 2, assembled: 3, first_color: 4, paint: 5, plinth: 6 }
  enum state: { wiating: 0, wip: 1, done: 2 }

  acts_as_list scope: :paint_list

  validates :step, presence: true
  validates :state, presence: true
  validates :size, presence: true
  validates :paint_list, presence: true
  validates :unit, presence: true
  validates :position, presence: true

  before_validation(on: :create) do
    self.step = :nothing
    self.state = :wiating
  end

end