class Tournament::Team < ApplicationRecord
    nilify_blanks :types => [:text, :string]
    strip_attributes
  
    belongs_to :event
    belongs_to :leader, class_name: "User"

    has_many :user_applies, -> { order 'position' }, dependent: :destroy
    accepts_nested_attributes_for :user_applies, :reject_if => :all_blank, :allow_destroy => true
  
    acts_as_list scope: :event    
  
    validates :event_id, :name, presence: true
    validates :position, numericality: { greater_than_or_equal_to: 1, allow_nil: false }
  
    before_validation on: :create do
      self.position = event.teams.count + 1
    end
  end