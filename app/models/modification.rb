class Modification < ApplicationRecord
  validates :description, presence: true
  validates :dish_allergy_id, presence: true
  validates :allergy_id, presence: true
  validates :dish_id, presence: true
  
  belongs_to :allergy
  belongs_to :dish
  belongs_to :dish_allergy
  belongs_to :restaurant
end
