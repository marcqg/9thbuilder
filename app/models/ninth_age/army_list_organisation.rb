class NinthAge::ArmyListOrganisation < ApplicationRecord

  belongs_to :army_list
  belongs_to :organisation

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end