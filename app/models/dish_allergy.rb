class DishAllergy < ApplicationRecord
  belongs_to :allergy
  belongs_to :dish
end
