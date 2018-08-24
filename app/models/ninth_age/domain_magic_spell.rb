class NinthAge::DomainMagicSpell < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :domain_magic, class_name: "NinthAge::DomainMagic"

  enum type_lvl: { Zero: 0, One: 1, Two: 2, Three: 3, Four: 4, Five: 5, Six: 6, A: 7, T: 8}

  translates :name, :range, :casting_value, :effect
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  bitmask :type_target, :as => [:Hex, :Hex_r, :Missile, :Damage, :Augment, :Augment_b, :Focused, :Direct, :Ground, :Universal, :Universal_g, :Caster, :Direct_r, :Universal_b, :Damage_r], :null => false
  bitmask :duration, :as => [:OneTurn, :Instant, :Permanent, :RemainsInPlay], :null => false

  validates :domain_magic_id, presence: true
  validates :type_lvl, presence: true
  validates :duration, presence: true

  def display_type_target
    names = []
    type_target.each do |tt|
      names << I18n.t("magic_spell.type_target.#{tt}", default: tt).to_highlight
    end
    names.join(', ').html_safe
  end

  def display_duration
    names = []
    duration.each do |tt|
      names << I18n.t("magic_spell.duration.#{tt}", default: tt).to_highlight
    end
    names.join(', ').html_safe
  end

  def display_type_lvl
    I18n.t("magic_spell.type_lvl.#{type_lvl}", default: type_lvl.titleize)
  end
end