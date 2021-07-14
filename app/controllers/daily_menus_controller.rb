class DailyMenusController < ApplicationController
  def new
    @daily_menu = DailyMenu.new
  end

  def create
    @daily_menu = DailyMenu.new(recipe_params)
    if @daily_menu.save
      flash[:notice] = "新しいレシピを登録しました！"
      redirect_to daily_menu_path(@daily_menu.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
end
