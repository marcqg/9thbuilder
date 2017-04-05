class NinthAge::Version < ApplicationRecord
  has_many :armies, dependent: :destroy
  has_many :magics, :class_name => 'NinthAge::Magic', dependent: :destroy

  translates :name
end
