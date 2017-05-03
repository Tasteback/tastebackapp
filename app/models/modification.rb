class Modification < ApplicationRecord
  belongs_to :allergy
  belongs_to :dish
  belongs_to :dish_allergy
  belongs_to :restaurant
end
