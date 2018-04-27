class Tournament::Round < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :event


  acts_as_list scope: :event
  

  validates :event_id, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 1, allow_nil: false }

  before_validation on: :create do
    self.position = event.rounds.count + 1
  end
end