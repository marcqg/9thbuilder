class NinthAge::Equipment < ApplicationRecord
  nilify_blanks :types => [:text, :string]
  strip_attributes

  belongs_to :version, class_name: "NinthAge::Version"
  belongs_to :army, class_name: "NinthAge::Army"

  has_many :equipment_unit_troops, dependent: :destroy, class_name: "NinthAge::EquipmentUnitTroop"

  translates :name, :description
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  enum type_lvl: { Global: 0, Defensive: 1, Offensive: 2}
  
  validates :type_lvl, presence: true

  def name_with_version
    "#{name} - #{version.name}"
  end

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  scope :ordered, -> { order("ninth_age_equipment_translations.name ASC") }
end
