class NinthAge::Version < ApplicationRecord
  has_many :armies, dependent: :destroy
  has_many :magics, dependent: :destroy

  translates :name
  globalize_accessors
end
