class Tournament::ArmyListApply < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :army_list, class_name: "Builder::ArmyList"
  delegate :user, :to => :army_list, :allow_nil => true
  belongs_to :event

  enum state: { pending: 0, cancel: 1, refused: 2, validated: 4 }
end