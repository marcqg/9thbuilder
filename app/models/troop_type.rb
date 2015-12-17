class TroopType < ActiveRecord::Base
  has_many :troops, dependent: :destroy

  validates :name, presence: true
end
