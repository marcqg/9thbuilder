class User < ApplicationRecord
  # Include default devise modules.
  include DeviseTokenAuth::Concerns::User
  rolify
  include Gravtastic
  gravtastic

  has_many :army_lists, class_name: 'Builder::ArmyList', dependent: :destroy
  has_many :armies, -> { distinct }, through: :army_lists
  belongs_to :favorite_army, class_name: 'NinthAge::Army'

  has_many :paint_lists, class_name: 'Paint::PaintList', dependent: :destroy
  has_many :paint_list_units, through: :paint_lists, class_name: 'Paint::PaintListUnit'

  has_many :tournaments, class_name: 'Tournament::Tournament', dependent: :destroy
  has_many :user_applies, class_name: 'Tournament::UserApply', dependent: :destroy


  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, email_regexp: /@/

  validates :name, presence: true

  def update_with_password(params = {})
    params.delete :current_password
    update_without_password params
  end

  before_validation do
    self.uid = email if uid.blank?
  end
end
