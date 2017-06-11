class DishAllergy < ApplicationRecord
  resourcify 
  
  validates :allergy_id, presence: true
  validates :dish_id, presence: true
  
  belongs_to :allergy, dependent: :destroy
  belongs_to :dish, dependent: :destroy
  has_one :modification
end
