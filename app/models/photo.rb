class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true, dependent: :destroy
  has_attached_file :image, styles: { large: "500x500>", medium: "300x300>", small: "200x200>", thumb: "150x150>" },  default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
