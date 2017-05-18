class AddIconToAllergy < ActiveRecord::Migration[5.1]
  def change
    add_attachment :allergies, :icon
  end
end
