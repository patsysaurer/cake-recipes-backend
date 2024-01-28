class CreateCakes < ActiveRecord::Migration[7.0]
  def change
    create_table :cakes do |t|
      t.string :cakeName
      t.text :cakeDescription
      t.text :cakeIngredients
      t.text :cakeInstructions
      t.integer :cakeServings
      t.text :cakeImage
      t.integer :user_id

      t.timestamps
    end
  end
end
