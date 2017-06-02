class Modification < ApplicationRecord
  validates :description, presence: true
  validates :dish_allergy_id, presence: true
  
  belongs_to :dish_allergy, dependent: :destroy
end
