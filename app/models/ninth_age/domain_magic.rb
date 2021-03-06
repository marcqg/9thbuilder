class NinthAge::DomainMagic < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :version, class_name: "NinthAge::Version"
  has_many :domain_magic_spells, class_name: "NinthAge::DomainMagicSpell"

  has_many :unit_options, class_name: "NinthAge::UnitOption"

  translates :name, :description
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  has_attached_file :logo,
                    styles: { facebook: '200x200^', large:  '300x300>', medium: '200x200>', thumb: '100x100>' },
                    default_url: ActionController::Base.helpers.image_path('magic.jpg')
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :version_id, presence: true

  def name_with_version
    "#{name} - #{version.name}"
  end

  def logo_url
    self.logo.url
  end

  def medium_logo_url
    self.logo.url(:medium)
  end

  scope :ordered, -> { order("ninth_age_domain_magic_translations.name ASC") }
end
