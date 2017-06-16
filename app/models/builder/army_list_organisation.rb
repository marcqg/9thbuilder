class Builder::ArmyListOrganisation < ApplicationRecord

  belongs_to :army_list
  belongs_to :organisation, :class_name => 'NinthAge::Organisation'

  validates :army_list_id, :organisation_id, presence: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  def create_or_add(organisation_id, army_list_id, points)

    organisation_rate = Builder::ArmyListOrganisation.find_by(organisation_id: organisation_id, army_list_id: army_list_id)

    #if the organisation not exist, create and set properties
    if nil == organisation_rate
      organisation_rate = Builder::ArmyListOrganisation.new
      organisation_rate.army_list_id = army_list_id
      organisation_rate.organisation_id = organisation_id
      organisation_rate.pts = points
    else
      organisation_rate.pts += army_list_unit.value_points
    end

    organisation_rate.save
  end
end