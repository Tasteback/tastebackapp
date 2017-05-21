class RemoveZipCodeFromRestaurants < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :zip_code
  end
end
