class Tournament::UserApply < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :user, class_name: "User"

  belongs_to :army, class_name: "NinthAge::Army"
  delegate :version, :to => :army, :allow_nil => true

  belongs_to :army_list, class_name: "Builder::ArmyList"

  belongs_to :event

  enum state: { pending: 0, cancel: 1, refused: 2, listValidation: 3, ListRefused: 4, validated: 5 }


  acts_as_list scope: :event


  validates :name, :event_id, :state, presence: true

  before_create on: :create do
    self.position = event.user_applies.count + 1
  end
end
