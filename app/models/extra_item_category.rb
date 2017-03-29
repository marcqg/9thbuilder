class ExtraItemCategory < ApplicationRecord
  belongs_to :army
  has_many :extra_items, dependent: :destroy

  validates :army_id, :name, presence: true
end
