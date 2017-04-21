class NinthAge::ArmyListOrganisation < ApplicationRecord

  belongs_to :army_list
  belongs_to :organisation

  validates :army_list_id, :organisation_id, presence: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end