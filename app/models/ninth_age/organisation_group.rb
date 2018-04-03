class NinthAge::OrganisationGroup < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes
  
  belongs_to :army_organisation, class_name: "NinthAge::ArmyOrganisation"

  belongs_to :organisation, class_name: "NinthAge::Organisation"

  enum type_target: { NoLimit: 0, Max: 1, Least: 2, NotAllowed: 3 }

  validates :army_organisation_id, presence: true
  validates :organisation_id, presence: true
  validates :type_target, presence: true

  def display_type_target
    I18n.t("organisation_group.display_type_target.#{type_target}", default: type_target.titleize)
  end

  def as_json(options={})
    super(:include => [:organisation])
  end
end