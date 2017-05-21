class RemoveDishIdAndAllergyIdFromModification < ActiveRecord::Migration[5.1]
  def change
    remove_column :modifications, :dish_id
    remove_column :modifications, :allergy_id
  end
end
