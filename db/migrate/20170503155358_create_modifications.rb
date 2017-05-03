class CreateModifications < ActiveRecord::Migration[5.1]
  def change
    create_table :modifications do |t|
      t.string :description
      t.belongs_to :dish_allergy
      t.belongs_to :allergy
      t.belongs_to :dish

      t.timestamps
    end
  end
end
