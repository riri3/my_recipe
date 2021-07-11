class Ingredient < ApplicationRecord
  
  has_many :recipe_ingredients, presence: true, dependent: :destroy
  
end
