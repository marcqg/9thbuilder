class NinthAge::ExtraItemCategory < ApplicationRecord
  belongs_to :army, class_name: "NinthAge::Army"
  has_many :extra_items, dependent: :destroy, class_name: "NinthAge::ExtraItem"

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  validates :army_id, presence: true
end
