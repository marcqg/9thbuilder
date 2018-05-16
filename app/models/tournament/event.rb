class Tournament::Event < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes


  belongs_to :creator, class_name: "User"

  belongs_to :version, class_name: "NinthAge::Version"

  has_many :user_applies, -> { order 'position' }, dependent: :destroy
  has_many :custom_points, dependent: :destroy

  has_many :rounds, -> { order 'position' }, dependent: :destroy
  has_many :matches, through: :rounds

  validates :creator_id, :version_id, :address, :latitude, :longitude, :start_date, :end_date, presence: true

  after_save on: :create do
  	self.rounds << Tournament::Round.create!({:event => self})
  end     
  
end
