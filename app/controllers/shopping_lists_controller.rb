class ShoppingListsController < ApplicationController
  def index
   from = Date.today.beginning_of_week
   to = Date.today.end_of_week
   @this_week = current_user.daily_menus.where(start_time: from...to) #今週の週間献立すべてを取得
   @recipes = @this_week.recipes.find(params[:id])                    #今週の週間献立のレシピを取得
   @ingredient_ids = @recipes.recipe_ingredients.pluck(:ingredient_id) # 中間テーブルからレシピの材料idを取得
   @ingredients = Ingredient.where(id: @ingredients_ids)               # 材料テーブルからそのレシピの材料idをもつ材料をpick up
   @memo = current_user.shopping_lists.new
  end

  def create
   @memo = current_user.shopping_lists.new(shopping_list_params)
    if @memo.save
      flash[:notice] = "新しいメモを登録しました！"
      redirect_to shopping_lists_path
    else
      render :index
    end
  end

  private
   def shopping_list_params
     params.require(:shopping_list).permit(:memo)
   end
end