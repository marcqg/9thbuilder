class Tournament::UserApply < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :user, class_name: "User"
  belongs_to :event

  enum state: { pending: 0, cancel: 1, refused: 2, listValidation: 3, validated: 4 }
end
