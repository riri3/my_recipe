class ShoppingListsController < ApplicationController
  def index
  # if params[:test]
  #   span = params[:test]
  #   if span == '1week'
  #     @from = params[:from].to_time.since(7.days)
  #     @to = params[:to].to_time.since(7.days)
  #   end
  #   else

  # 今週１週間の日付を取得
      now = Time.current
      @from = now.next_week(:monday)
      @to = now.next_week(:sunday)
    # end

  #今週の週間献立すべてを取得
   @this_week = current_user.daily_menus.where(start_time: @from...@to)

  #今週の週間献立に登録されているレシピを取得
   recipe_ids = []
   @this_week.each do |menu|
     recipe = menu.recipe
     recipe_ids << recipe.id
   end

   # 中間テーブルからレシピの材料idを取得
   @ingredient_ids = RecipeIngredient.where(:recipe_id => recipe_ids).pluck(:ingredient_id)

   # 材料テーブルからそのレシピの材料idをもつ材料を取得
   @ingredients = Ingredient.where(id: @ingredient_ids).order(name: :ASC)

   @memo = current_user.shopping_lists.new
  end

  def create
   @memo = current_user.shopping_lists.new(shopping_list_params)
    if @memo.save

      flash[:notice] = "新しいメモを登録しました！"
      redirect_to shopping_list_path(@memo.id)
    else
      flash.now[:alert] = "登録内容が正しくありません"
      render :index
    end
  end

  def show
   @memo = current_user.shopping_lists.find(params[:id])
  end

  private
   def shopping_list_params
     params.require(:shopping_list).permit(:user_id, :memo)
   end
end