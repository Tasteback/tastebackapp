class RenameDishAllergiesTable < ActiveRecord::Migration[5.1]
  def change
  def self.up
    rename_table :dish_allergies, :dishes_allergies
  end

  def self.down
    rename_table :dishes_allergies, :dish_allergies
  end
  end
end
