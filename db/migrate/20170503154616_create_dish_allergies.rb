class CreateDishAllergies < ActiveRecord::Migration[5.1]
  def change
    create_table :dish_allergies do |t|
      t.belongs_to :dish
      t.belongs_to :allergy
      
      t.timestamps
    end
  end
end
