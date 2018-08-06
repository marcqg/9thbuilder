class NinthAge::Organisation < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :army, class_name: "NinthAge::Army"

  has_and_belongs_to_many  :units, -> { includes(:translations).order(:position) }, class_name: "NinthAge::Unit"

  has_many :organisation_groups, class_name: "NinthAge::OrganisationGroup"

  has_many :army_lists, class_name: 'Builder::ArmyList'

  has_many :army_list_organisations, class_name: 'Builder::ArmyListOrganisation'

  has_many :default_organisations, foreign_key: :default_organisation_id, class_name: 'NinthAge::OrganisationChange'
  #has_many :defaults, through: :default_organisations, source: :default_organisation

  has_many :new_organisations, foreign_key: :new_organisation_id, class_name: 'NinthAge::OrganisationChange'
  #has_many :news, through: :new_organisations, source: :new_organisation

  has_many :unit_options, class_name: "NinthAge::UnitOption"

  has_many :add_from_magic_standards, foreign_key: :organisation_id, class_name: "NinthAge::MagicStandard"
  has_and_belongs_to_many :magic_standards, dependent: :destroy, class_name: "NinthAge::MagicStandard"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  has_attached_file :logo,
                    styles: { large:  '300x300>', medium: '200x200>', thumb: '100x100>' },
                    default_url: ActionController::Base.helpers.image_path('organisation.jpg')
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :army_id, presence: true

  scope :ordered, -> { order("ninth_age_organisation_translations.name ASC") }

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  def logo_url
    self.logo.url
  end

  def medium_logo_url
    self.logo.url(:medium)
  end

  def thumb_logo_url
    self.logo.url(:thumb)
  end
end