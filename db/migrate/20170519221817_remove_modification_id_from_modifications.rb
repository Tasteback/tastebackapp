class RemoveModificationIdFromModifications < ActiveRecord::Migration[5.1]
  def change
    remove_column :modifications, :restaurant_id
  end
end
