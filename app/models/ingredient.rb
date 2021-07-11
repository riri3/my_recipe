class Ingredient < ApplicationRecord

  has_many :recipe_ingredients, dependent: :destroy

end
