class DailyMenusController < ApplicationController

  def index
    @daily_menu = current_user.daily_menus.new
    @daily_menus = current_user.daily_menus.all.order(start_time: :ASC, meal_time_id: :ASC)
  end


  def create
    @daily_menu = current_user.daily_menus.new(daily_menu_params)
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
    @daily_menus = current_user.daily_menus.where(start_time: (now.beginning_of_day)..(now.end_of_day))
    # @morning = @daily_menu.where(meal_time_id: 1)     # 朝食
    # @lunch = @daily_menu.where(meal_time_id: 2)       # 昼食
    # @dinnder = @daily_menu.where(meal_time_id: 3)     # 夕食
  end


  def edit
    @daily_menu = DailyMenu.find(params[:id])
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
    params.require(:daily_menu).permit( :user_id, :recipe_id, :start_time, :meal_time_id, :memo)
  end
end
