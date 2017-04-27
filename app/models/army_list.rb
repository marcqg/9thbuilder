class ArmyList < ApplicationRecord
  belongs_to :army, :class_name => 'NinthAge::Army'
  belongs_to :user

  has_many :army_list_units, -> { order 'position' }, dependent: :destroy

  belongs_to :army_organisation, :class_name => 'NinthAge::ArmyOrganisation'
  has_many :army_list_organisations, :class_name => 'NinthAge::ArmyListOrganisation', dependent: :destroy

  validates :army_id, :user_id, :army_organisation_id, :uuid, :name, :value_points, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0 }

  normalize_attributes :name, :notes

  before_validation(on: :create) do
    self.uuid = UUIDTools::UUID.random_create.to_s
    self.name = 'List ' + army.name + ' #' + (user.army_lists.where(army_id: army).count + 1).to_s unless name?
    self.value_points = 0.0
  end

  def to_param
    uuid
  end
end
