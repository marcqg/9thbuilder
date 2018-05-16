class Tournament::Match < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :round
  belongs_to :user_apply

  validates :round_id, :user_apply_id, presence: true
  validates :table, numericality: { greater_than_or_equal_to: 1, allow_nil: false }
  validates :points, numericality: { greater_than_or_equal_to: 0, allow_nil: false }

end