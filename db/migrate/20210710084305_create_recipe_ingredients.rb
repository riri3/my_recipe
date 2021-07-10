class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id,       null: false
      t.integer :ingredient_id,   null: false
      t.float :quantity,          null: false

      t.timestamps
    end
  end
end
