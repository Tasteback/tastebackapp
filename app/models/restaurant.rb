class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  has_many :dishes
  has_many :modifications
  has_many :reviews
  
  geocoded_by :address
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  #average rating method

end
