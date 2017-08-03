class Battle::Round < ApplicationRecord

  has_and_belongs_to_many :armies, :class_name => 'NinthAge::Army'

  validates :date, presence: true
end
