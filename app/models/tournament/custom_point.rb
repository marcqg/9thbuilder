class Tournament::CustomPoint < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :event
  belongs_to :user_apply


  validates :event_id, :user_apply_id, presence: true
  validates :paint_points, :wysiwyg_points, :list_points, :total_points, numericality: { greater_than_or_equal_to: 0, allow_nil: false }

  before_validation do
    self.total_points = self.paint_points + self.wysiwyg_points + self.list_points
  end

end