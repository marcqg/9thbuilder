class NinthAge::Organisation < ApplicationRecord
  # default_scope { includes(:translations) }

  belongs_to :army

  has_and_belongs_to_many  :units

  has_many :organisation_groups

  has_many :army_lists

  has_many :army_list_organisations

  has_many :default_organisations, foreign_key: :default_organisation_id, class_name: 'NinthAge::OrganisationChange'
  #has_many :defaults, through: :default_organisations, source: :default_organisation

  has_many :new_organisations, foreign_key: :new_organisation_id, class_name: 'NinthAge::OrganisationChange'
  #has_many :news, through: :new_organisations, source: :new_organisation

  has_many :unit_options

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  has_attached_file :logo,
                    styles: { large:  '300x300>', medium: '200x200>', thumb: '100x100>' },
                    default_url: ActionController::Base.helpers.image_path('organisation.jpg')
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :army_id, presence: true

  def logo_url
    self.logo.url
  end

  def medium_logo_url
    self.logo.url(:medium)
  end
end