class Allergy < ApplicationRecord
  has_many :dish_allergies
  has_many :dishes, through: :dish_allergies
  has_many :modifications
end
