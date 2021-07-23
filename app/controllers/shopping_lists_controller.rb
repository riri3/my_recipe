class ShoppingListsController < ApplicationController
  def index
　 from  = Date.today.beginning_of_week
   to    = Date.end_of_week
   @lists = current_user.daily_menus.where(start_time: from...to)

   @weekly_menu = current_user.daily_menu.revcupe
   @ingredients_ids = @weekly_menu.recipe_ingredients.pluck(:ingredient_id) # 中間テーブルからレシピの材料idをpick up
   @ingredients = Ingredient.where(id: @ingredients_ids)
   @list = @ingredients.where()
  end
end