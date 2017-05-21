require "open-uri"
class Allergy < ApplicationRecord
  validates :name, presence: true
  has_many :dish_allergies
  has_many :dishes, through: :dish_allergies
  has_many :user_allergies
  has_many :users, through: :user_allergies

   has_attached_file :icon, styles: { thumb: "80x80>" }, default_url: ":style/missing.png"
   validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/

   def picture_from_url(url)
    self.icon = URI.parse(url)
  end
end
