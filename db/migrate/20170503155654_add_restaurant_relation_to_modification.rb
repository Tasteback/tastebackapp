class AddRestaurantRelationToModification < ActiveRecord::Migration[5.1]
  def change
    add_column :modifications, :restaurant_id, :integer
  end
end
