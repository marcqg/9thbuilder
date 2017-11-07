class NinthAge::DomainMagicSpell < ApplicationRecord

  belongs_to :domain_magic

  enum type_lvl: { Zero: 0, One: 1, Two: 2, Three: 3, Four: 4, Five: 5, Six: 6, A: 7, T: 8}

  translates :name, :range, :casting_value, :effect
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  bitmask :type_target, :as => [:Hex, :Hex_r, :Missile, :Damage, :Augment, :Augment_b, :Focused, :Direct, :Ground, :Universal, :Universal_g, :Caster], :null => false
  bitmask :duration, :as => [:OneTurn, :Instant, :Permanent, :RemainsInPlay], :null => false

  validates :domain_magic_id, :type_lvl, :duration, presence: true

  def highlight(text)
    if text != nil
      text = text.gsub(/<([\wàäâáæãåéèëêïîìíöôòóœøõùüûúÿýçñ,\ \+\.\(\)\-"]*)>/u, '<strong>\1</strong>').html_safe
      text = text.gsub(/\{([\wàäâáæãåéèëêïîìíöôòóœøõùüûúÿýçñ,\ \+\.\(\)\-"]*)\}/u, '<span class="highlight-green">{\1}</span>').html_safe
      text = text.gsub(/\[([\wàäâáæãåéèëêïîìíöôòóœøõùüûúÿýçñ,\ \+\.\(\)\-"]*)\]/u, '<span class="highlight-blue">[\1]</span>').html_safe
      text = text.gsub(/\|([\wàäâáæãåéèëêïîìíöôòóœøõùüûúÿýçñ,\ \+\.\(\)\-"]*)\|/u, '<span class="highlight-red">\1</span>').html_safe
      return text
    end

    return nil
  end

  def display_type_target
    names = []
    type_target.each do |tt|
      display_name = highlight(I18n.t("magic_spell.type_target.#{tt}", default: tt))
      names << display_name
    end
    names.join(', ').html_safe
  end

  def display_duration
    names = []
    duration.each do |tt|
      display_name = highlight(I18n.t("magic_spell.duration.#{tt}", default: tt))
      names << display_name
    end
    names.join(', ').html_safe
  end

  def display_type_lvl
    I18n.t("magic_spell.type_lvl.#{type_lvl}", default: type_lvl.titleize)
  end

  def display_range
    highlight(range).html_safe
  end

  def display_effect
    highlight(effect).html_safe
  end

  def display_casting_value
    highlight(casting_value).html_safe
  end
end