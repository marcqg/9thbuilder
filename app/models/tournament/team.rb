class Tournament::Team < ApplicationRecord
    nilify_blanks :types => [:text, :string]
    strip_attributes
  
    belongs_to :event
    belongs_to :leader, class_name: "User"
  
    acts_as_list scope: :event    
  
    validates :event_id, :name, :leader_name, :leader_email, presence: true
    validates :position, numericality: { greater_than_or_equal_to: 1, allow_nil: false }
  
    before_validation on: :create do
      self.position = event.teams.count + 1
    end
  end