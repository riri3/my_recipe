class Recipe < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :recipe_ingredients, dependent: :destroy
  has_many :daily_menus, dependent: :destroy

  attachment :image, destroy: false

end
