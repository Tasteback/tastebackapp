class DishAllergy < ApplicationRecord
  resourcify 
  
  validates :allergy_id, presence: true
  validates :dish_id, presence: true
  
  belongs_to :allergy
  belongs_to :dish
  has_one :modification
end
