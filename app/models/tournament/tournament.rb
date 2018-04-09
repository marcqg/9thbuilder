class Tournament::Tournament < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :creator, class_name: "User"
end
