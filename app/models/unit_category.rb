class UnitCategory < ActiveRecord::Base
  has_many :units, dependent: :destroy

  validates :name, presence: true
end
