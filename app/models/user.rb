class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  has_many :user_allergies
  has_many :allergies, through: :user_allergies
  has_many :reviews

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style/user.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end
