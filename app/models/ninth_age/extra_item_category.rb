class NinthAge::ExtraItemCategory < ApplicationRecord
  belongs_to :army
  has_many :extra_items, dependent: :destroy

  translates :name
  globalize_accessors
  accepts_nested_attributes_for :translations, allow_destroy: true

  validates :army_id, presence: true
end
