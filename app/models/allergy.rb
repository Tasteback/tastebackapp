class Allergy < ApplicationRecord
  has_and_belongs_to_many :dishes, through: :dish_allergies
  has_many :modifications
end
