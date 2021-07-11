class Recipe < ApplicationRecord
  
  belongs_to :user
  belongs_to :genre
  has_many :recipe_ingredients, presence: true, dependent: :destroy
  has_many :daily_menus, presence: true, dependent: :destroy
  
end
