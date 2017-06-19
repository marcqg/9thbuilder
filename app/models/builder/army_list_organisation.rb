class Builder::ArmyListOrganisation < ApplicationRecord

  belongs_to :army_list
  belongs_to :organisation, :class_name => 'NinthAge::Organisation'

  validates :army_list_id, :organisation_id, presence: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end