class Allergy < ApplicationRecord
  has_many :dish_allergies
  has_many :dishes, through: :dish_allergies
  has_many :modifications
  has_many :user_allergies
  has_many :users, through: :user_allergies
end
