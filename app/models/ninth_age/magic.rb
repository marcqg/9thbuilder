class NinthAge::Magic < ApplicationRecord

  belongs_to :version
  has_many :magic_spells

  has_many :unit_options

  translates :name, :description
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  has_attached_file :logo,
                    styles: { large:  '300x300>', medium: '200x200>', thumb: '100x100>' },
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

  def highlight(text)
    if text != nil
      text = text.gsub(/<([\w,\ \+\.\(\)\-"]*)>/, '<strong>\1</strong>').html_safe
      text = text.gsub(/\{([\w,\ \+\.\(\)\-"]*)\}/, '<span class="highlight-green">{\1}</span>').html_safe
      text = text.gsub(/\[([\w,\ \+\.\(\)\-"]*)\]/, '<span class="highlight-blue">[\1]</span>').html_safe
      text = text.gsub(/\|([\w,\ \+\.\(\)\-"]*)\|/, '<span class="highlight-red">\1</span>').html_safe
      return text
    end

    return nil
  end

  def display_description
    highlight(description)
  end
end
