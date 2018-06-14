class NinthAge::ArmyMagicSpell < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :army, class_name: "NinthAge::Army"

  translates :name, :description, :range, :casting_value, :effect
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  bitmask :type_target, :as => [:Hex, :Hex_r, :Missile, :Damage, :Augment, :Augment_b, :Focused, :Direct, :Ground, :Universal, :Universal_g, :Augment_r, :Hex_b], :null => false
  bitmask :duration, :as => [:OneTurn, :Instant, :Permanent, :RemainsInPlay], :null => false

  validates :army_id, :duration, presence: true

  def display_type_target
    names = []
    type_target.each do |tt|
      display_name = I18n.t("magic_spell.type_target.#{tt}", default: tt).to_highlight
      names << display_name
    end
    names.join(', ').html_safe
  end

  def display_duration
    names = []
    duration.each do |tt|
      display_name = I18n.t("magic_spell.duration.#{tt}", default: tt).to_highlight
      names << display_name
    end
    names.join(', ').html_safe
  end

  def display_type_lvl
    if type_lvl.nil?
      return nil
    end
    I18n.t("magic_spell.type_lvl.#{type_lvl}", default: type_lvl.titleize)
  end
end