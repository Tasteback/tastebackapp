class Review < ApplicationRecord
  validates :rating, presence: true
  validates :text, presence: true
  validates :user_id, presence: true
  validates :restaurant_id, presence: true

  belongs_to :restaurant
  belongs_to :user
end
