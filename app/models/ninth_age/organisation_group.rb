class NinthAge::OrganisationGroup < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes
  
  belongs_to :army_organisation, class_name: "NinthAge::ArmyOrganisation"
  delegate :army, :to => :army_organisation, :allow_nil => true
  delegate :version, :to => :army, :allow_nil => true

  belongs_to :organisation, class_name: "NinthAge::Organisation"

  enum type_target: { NoLimit: 0, Max: 1, Least: 2, NotAllowed: 3 }

  validates :army_organisation_id, presence: true
  validates :organisation_id, presence: true
  validates :type_target, presence: true
  validates :target, presence: true, if: ->(group){ group.Max? or group.Least?}

  attr_accessor :army_filter
  attr_accessor :version_filter

  def army_filter
    @army_filter ||= army_organisation.try(:army).try(:id)
    @army_filter ||= army_organisation.try(:organisation).try(:id)
  end

  def version_filter
    @version_filter ||= army_organisation.try(:army).try(:version).try(:id)
    @version_filter ||= army_organisation.try(:organisation).try(:version).try(:id)
  end

  def display_type_target
    I18n.t("organisation_group.display_type_target.#{type_target}", default: type_target.titleize)
  end

  def as_json(options={})
    super(:include => [:organisation])
  end
end