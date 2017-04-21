class NinthAge::Magic < ApplicationRecord

  belongs_to :version
  has_many :magic_spells

  translates :name, :description
  globalize_accessors

  has_attached_file :logo,
                    styles: { medium: '200x200>', thumb: '65x65>' },
                    default_url: ActionController::Base.helpers.image_path('army.jpg'),
                    path: 'images/:class/:id/:style/:filename'
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  validates :version_id, :name, :description, presence: true

  def logo_url
    self.logo.url
  end

  def medium_logo_url
    self.logo.url(:medium)
  end

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
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
