class UserAllergy < ApplicationRecord
  validates :user_id, presence: true
  validates :allergy_id, presence: true

  belongs_to :user
  belongs_to :allergy
end
