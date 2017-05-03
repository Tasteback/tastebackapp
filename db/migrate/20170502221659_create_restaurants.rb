class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :cuisine
      t.string :address
      t.string :area
      t.string :zip_code
      t.string :price_range
      t.string :hours
      t.string :url
      t.string :phone_number

      t.timestamps
    end
  end
end
