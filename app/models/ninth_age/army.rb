class NinthAge::Army < ApplicationRecord

  belongs_to :version

  has_many :army_organisations
  has_many :organisation_groups, through: :army_organisations

  has_many :organisations

  has_many :special_rules

  has_many :army_lists, dependent: :destroy
  has_many :magic_items, dependent: :destroy
  has_many :magic_standards, dependent: :destroy
  has_many :extra_item_categories, dependent: :destroy
  has_many :units, -> { includes(:translations).order(:name) }, :class_name => 'NinthAge::Unit', dependent: :destroy
  has_many :favorite_users, class_name: 'User', foreign_key: 'favorite_army_id', dependent: :nullify

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  scope :disabled, -> { where('id NOT IN (SELECT DISTINCT army_id FROM ninth_age_units)') }
  scope :disabled_or_obsolete, -> { where('id NOT IN (SELECT DISTINCT army_id FROM ninth_age_units)') }

  def obsolete?
    name =~ /obsolète/i
  end

  has_attached_file :logo,
                    styles: { medium: '200x200>', thumb: '65x65>' },
                    default_url: ActionController::Base.helpers.image_path('army.jpg'),
                    path: 'images/:class/:id/:style/:filename'
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  def logo_url
    self.logo.url
  end

  def medium_logo_url
    self.logo.url(:medium)
  end

  def name_with_version
    "#{name} - #{version.name}"
  end

  def duplicate
    new_units = {}

    new_army = dup
    new_army.name = "Copy of #{new_army.name}"
    new_army.units << units.collect { |unit| new_units[unit.id] = unit.duplicate }

    new_army.units.each do |unit|
      unit.unit_options.map do |unit_option|
        unit_option.mount = new_units[unit_option.mount.id] unless unit_option.mount.nil?
      end
    end

    new_army
  end
end
