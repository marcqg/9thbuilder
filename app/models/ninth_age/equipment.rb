class NinthAge::Equipment < ApplicationRecord

  belongs_to :version

  has_many :equipment_unit_troops, dependent: :destroy

  translates :name, :description
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  enum type_lvl: { Global: 0, Defensive: 1, Offensive: 2}

  def name_with_version
    "#{name} - #{version.name}"
  end

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
