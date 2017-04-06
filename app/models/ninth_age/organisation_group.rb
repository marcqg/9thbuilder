class NinthAge::OrganisationGroup < ApplicationRecord
  belongs_to :army_organisation

  belongs_to :organisation

  enum type_target: { NoLimit: 0, Max: 1, Least: 2, NotAllowed: 3 }

  def display_type_target
    I18n.t("organisation_group.display_type_target.#{type_target}", default: type_target.titleize)
  end

  def as_json(options={})
    super(:include => [:organisation])
  end
end