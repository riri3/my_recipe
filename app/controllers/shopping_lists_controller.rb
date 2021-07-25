class ShoppingListsController < ApplicationController
  def index
  # if params[:test]
  #   span = params[:test]
  #   if span == '1week'
  #     @from = params[:from].to_time.since(7.days)
  #     @to = params[:to].to_time.since(7.days)
  #   end
  #   else
      now = Time.current
      @from = now.beginning_of_week
      @to = now.end_of_week
    # end
    # binding.irb
   @this_week = current_user.daily_menus.where(start_time: @from...@to) #今週の週間献立すべてを取得

   recipe_ids = []#今週の週間献立のレシピを取得
   @this_week.each do |menu|
     recipe = menu.recipe
     recipe_ids << recipe.id
   end
   #@recipes = Recipe.where(:id => recipe_ids)
   #@ingredient_ids = @recipes.recipe_ingredients.pluck(:ingredient_id)
   @ingredient_ids = RecipeIngredient.where(:recipe_id => recipe_ids).pluck(:ingredient_id) # 中間テーブルからレシピの材料idを取得
   @ingredients = Ingredient.where(id: @ingredient_ids).order(name: :ASC)           # 材料テーブルからそのレシピの材料idをもつ材料をpick up
  # @memo = current_user.shopping_lists.new
  end

  def create
   @memo = current_user.shopping_lists.new(shopping_list_params)
    if @memo.user_id = current_user.id
      @memo.save
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