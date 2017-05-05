class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :modifications
  has_many :dish_allergies
  has_many :allergies, through: :dish_allergies 
end
