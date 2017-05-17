class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :text
      t.belongs_to :user
      t.belongs_to :restaurant
      
      t.timestamps
    end
  end
end
