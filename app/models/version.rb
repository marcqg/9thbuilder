class Version < ApplicationRecord
  has_many :army, dependent: :destroy

  translates :name
end
