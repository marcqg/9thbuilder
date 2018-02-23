class NinthAge::ExtraItemCategory < ApplicationRecord
  nilify_blanks :types => [:text, :string]

  belongs_to :version, class_name: "NinthAge::Version"
  belongs_to :army, class_name: "NinthAge::Army"
  
  has_many :extra_items, dependent: :destroy, class_name: "NinthAge::ExtraItem"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  validates :army_id, presence: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end
end
