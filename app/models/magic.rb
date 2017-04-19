class Magic < ApplicationRecord

  belongs_to :version
  has_many :magic_spells

  translates :name, :description
  globalize_accessors

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
