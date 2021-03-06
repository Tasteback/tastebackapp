class Restaurant < ApplicationRecord
  resourcify 
  
  validates :name, presence: true
  validates :address, presence: true

  has_many :dishes, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :photos, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :dishes, allow_destroy: true
  
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
