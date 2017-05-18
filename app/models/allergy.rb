class Allergy < ApplicationRecord
  validates :name, presence: true
  has_many :dish_allergies
  has_many :dishes, through: :dish_allergies
  has_many :modifications
  has_many :user_allergies
  has_many :users, through: :user_allergies

  # has_attached_file :icon, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
