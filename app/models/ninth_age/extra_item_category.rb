class NinthAge::ExtraItemCategory < ApplicationRecord
  belongs_to :army
  has_many :extra_items, dependent: :destroy

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  def cache_key
    super + '-ninth-age-' + Globalize.locale.to_s
  end

  validates :army_id, presence: true
end
