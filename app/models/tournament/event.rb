class Tournament::Event < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes


  belongs_to :creator, class_name: "User"

  belongs_to :version, class_name: "NinthAge::Version"
  
  has_many :teams, -> { order 'position' }, dependent: :destroy

  has_many :user_applies, -> { order 'position' }, dependent: :destroy
  has_many :custom_points, dependent: :destroy

  has_many :rounds, -> { order 'position' }, dependent: :destroy
  has_many :matches, through: :rounds

  enum participation: { individual: 1, team: 2}

  validates :uuid, :creator_id, :version_id, :address, :latitude, :longitude, :start_date, :end_date, presence: true
  validates :team_max, numericality: { greater_than_or_equal_to: 0, allow_nil: false }, if: ->(event){ event.team?}
  validates :user_max, numericality: { greater_than_or_equal_to: 0, allow_nil: false }

  after_save on: :create do
  	self.rounds << Tournament::Round.create!({:event => self})
  end     
  
  before_validation(on: :create) do
    self.uuid = UUIDTools::UUID.random_create.to_s
  end

  def to_param
    uuid
  end

end
