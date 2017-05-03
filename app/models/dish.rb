class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :modifications
  has_and_belongs_to_many :allergies, through: :dish_allergies 
end
