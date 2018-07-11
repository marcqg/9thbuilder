class Builder::ArmyList < ApplicationRecord
  belongs_to :version, :class_name => 'NinthAge::Version'
  belongs_to :army, :class_name => 'NinthAge::Army'
  belongs_to :user

  has_many :army_list_units, -> { order 'position' }, dependent: :destroy

  has_many :army_list_unit_extra_items, :class_name => 'Builder::ArmyListUnitExtraItem', through: :army_list_units
  has_many :extra_items, :class_name => 'NinthAge::ExtraItem', through: :army_list_unit_extra_items

  has_many :army_list_unit_magic_items, :class_name => 'Builder::ArmyListUnitMagicItem', through: :army_list_units
  has_many :magic_items, :class_name => 'NinthAge::MagicItem', through: :army_list_unit_magic_items


  has_many :army_list_unit_magic_standards, :class_name => 'Builder::ArmyListUnitMagicStandard', through: :army_list_units
  has_many :magic_standards, :class_name => 'NinthAge::MagicStandard', through: :army_list_unit_magic_standards


  belongs_to :army_organisation, :class_name => 'NinthAge::ArmyOrganisation'
  has_many :army_list_organisations, dependent: :destroy

  has_many :army_list_applies, :class_name => 'Tournament::ArmyListApply'

  validates :version_id, :army_id, :user_id, :army_organisation_id, :uuid, :name, :value_points, presence: true
  validates :value_points, numericality: { greater_than_or_equal_to: 0 }
  validates :max, numericality: { greater_than_or_equal_to: 1 }, if: ->(list){list.rate_with_max?}

  normalize_attributes :name, :notes

  before_validation(on: :create) do
    self.uuid = UUIDTools::UUID.random_create.to_s
    self.name = 'List ' + army.name + ' #' + (user.army_lists.where(army_id: army).count + 1).to_s unless name?
    self.value_points = 0.0
  end

  def to_param
    uuid
  end

  
  def update_organisations

    self.army_list_organisations.update_all(pts: 0, rate: 0)

    self.army_list_units.each do |army_list_unit|

      #Sum points for all figurines
      army_list_unit.unit.organisations.each do |organisation|

        organisation_change = NinthAge::OrganisationChange.find_by({unit_id: army_list_unit.unit_id, default_organisation_id: organisation.id})
        isChange = nil != organisation_change && ((organisation_change.Min? && organisation_change.number <= army_list_unit.size) || (organisation_change.Max? && organisation_change.number >= army_list_unit.size))

        org_id = (isChange ? organisation_change.new_organisation_id : organisation.id)

        organisation_rate = self.army_list_organisations.find_or_create_by({organisation_id: org_id, army_list_id: self.id})
        organisation_rate.pts += army_list_unit.value_points
        organisation_rate.save!
      end

      #Sum points for mounts
      mount_option = army_list_unit.unit_options.where.not(:mount => nil).first
      if nil != mount_option

        orgs = mount_option.mount
                            .organisations
                            .where.not(:id => army_list_unit.unit.organisation_ids)

        ogrs.each do |mount_organisation|
          organisation_rate = self.army_list_organisations.find_or_create_by({organisation_id: mount_organisation.id, army_list_id: self.id})

          unless mount_option.mount_and_carac_points
            organisation_rate.pts += mount_option.value_points # Only mount in other organisation
          else
            organisation_rate.pts += army_list_unit.value_points # carac + mount in other organisation
          end
          organisation_rate.save!
        end
      end

      #Options with organisations
      army_list_unit.army_list_unit_unit_options.joins(:unit_option).where.not(:ninth_age_unit_options => {:organisation_id => nil}).each do |unit_option|
        organisation_rate = self.army_list_organisations.find_or_create_by({organisation_id: unit_option.unit_option.organisation_id, army_list_id: self.id})
        organisation_rate.pts += army_list_unit.value_points
        organisation_rate.save!
      end

      #Sum by banners
      army_list_unit.army_list_unit_magic_standards.each do |magic_standard|
        unless magic_standard.magic_standard.organisation_id.nil?
          organisation_rate = self.army_list_organisations.find_or_create_by({organisation_id: magic_standard.magic_standard.organisation_id, army_list_id: self.id})
          organisation_rate.pts += army_list_unit.value_points
          organisation_rate.save!
        end
      end
    end

    pts = if self.rate_with_max
      self.max
    else
      self.army_list_units.map(&:value_points).reduce(0, :+)
    end

    if pts != 0
      self.army_list_organisations.where(army_list_id: self.id).each do |organisation|
        organisation.rate = organisation.pts * 100.0 / pts
        organisation.save!
      end
    end

    army_organisation = NinthAge::ArmyOrganisation.find(self.army_organisation_id)
    army_organisation.organisation_groups.each do |organisation_group|

      organisation = self.army_list_organisations.find_or_create_by(army_list_id: self.id, organisation_id: organisation_group.organisation_id)
      
      case organisation_group.type_target.to_sym
        when :NoLimit
          organisation.good = true
        when :Max
          organisation.good = organisation.rate <= organisation_group.target
        when :Least
          organisation.good = organisation.rate >= organisation_group.target
        when :NotAllowed
          organisation.good = organisation.rate == 0
      end

      organisation.save
    end
  end
end
