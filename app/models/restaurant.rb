class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  has_many :dishes
  has_many :reviews
  has_many :photos, as: :imageable
  
  geocoded_by :address
  after_validation :geocode
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  def average_rating
    if self.reviews.size > 0
      return self.reviews.average(:rating).to_i
    else
      return 0
    end
  end

end
