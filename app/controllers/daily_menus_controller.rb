class DailyMenusController < ApplicationController

  def index
    # now = Time.current
    # @daily_menus = DailyMenu.where(setting_date: (now.beginning_of_day)..(now.end_of_day))
     @daily_menu = current_user.daily_menus.new
    # @recipe = Recipe.where(recipe_id :@daily_menu.id)
    # @morning = @daily_menus.where(meal_time_id: 1)  # 朝食
    # @lunch = @daily_menus.where(meal_time_id: 2)    # 昼食
    # @dinnder = @daily_menus.where(meal_time_id: 3)  # 夕食
  end


  def create
    @daily_menu= current_user.daily_menus.new(daily_menu_params)
    # @daily_menu = DailyMenu.new(daily_menu_params)
    if @daily_menu.user_id = current_user.id
      @daily_menu.save
      flash[:notice] = "レシピを登録しました！"
      redirect_to daily_menus_path
    else
      render :new
    end
  end

  def show
    now = Time.current
    @daily_menus = DailyMenu.where(setting_date: (now.beginning_of_day)..(now.end_of_day))
    # @morning = @daily_menu.where(meal_time_id: 1)     # 朝食
    # @lunch = @daily_menu.where(meal_time_id: 2)       # 昼食
    # @dinnder = @daily_menu.where(meal_time_id: 3)     # 夕食
    #@ingredients_ids = @recipe.recipe_ingredients.pluck(:ingredient_id) # 中間テーブルからレシピの材料idをpick up
    #@ingredients = Ingredient.where(id: @ingredients_ids)               # 材料テーブルからそのレシピの材料idをもつ材料をpick up
  end


  def edit
    @daily_menu = DailyMenu.find(params[:id])
    @recipe.recipe_ingredients.build
  end

  def update
   @daily_menu = DailyMenu.find(params[:id])
    if @daily_menu.update(daily_menu_params)
      flash[:notice] = "登録情報を変更しました!"
      redirect_to daily_menu_path(@daily_menu.id)
    else
      render 'edit'
    end
  end

  def destroy
    daily_menu = DailyMenu.find(params[:id])
    daily_menu.destroy
    redirect_to daily_menus_path
  end

  private
  def daily_menu_params
    params.require(:daily_menu).permit( :recipe_id, :setting_date, :meal_time_id)
                                  # ingredients_attributes: [:name, :unit, :quantity])
  end
end
