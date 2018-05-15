class Tournament::Match < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :round


  acts_as_list scope: :round
  

  validates :round_id, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 1, allow_nil: false }

  before_validation on: :create do
    self.position = round.matchs.count + 1
  end
end