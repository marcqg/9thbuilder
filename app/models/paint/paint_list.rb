class Paint::PaintList < ApplicationRecord

  belongs_to :army, :class_name => 'NinthAge::Army'
  belongs_to :user

  has_many :paint_list_units, -> { order 'position' }, dependent: :destroy

  validates :army_id, presence: true
  validates :user_id, presence: true
  validates :name, presence: true
  
    before_validation(on: :create) do
    self.name = 'List ' + army.name + ' #' + (user.paint_lists.where(army_id: army).count + 1).to_s unless name?
  end
end