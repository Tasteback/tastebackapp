class Dish < ApplicationRecord
  resourcify 
  
  validates :name, presence: true
  validates :restaurant_id, presence: true
  belongs_to :restaurant
  has_many :dish_allergies, dependent: :destroy
  has_many :allergies, through: :dish_allergies 
  has_many :photos, as: :imageable, dependent: :destroy

  scope :restaurant, -> (restaurant_id) { where(restaurant_id: restaurant_id)}

  scope :includes_allergies, -> (allergies) {
    self.includes_any_of_allergies(allergies)
    .group("dishes.id")
    .having("COUNT(*) = ?", allergies.length)
  }

  scope :includes_any_of_allergies, -> (allergies) {
    joins(:dish_allergies)
    .where(dish_allergies: { allergy_id: allergies}).distinct
  }
end
