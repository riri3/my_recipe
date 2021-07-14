class DailyMenusController < ApplicationController
  def new
    @daily_menu = DailyMenu.all
  end

  def show
  end

  def edit
  end
end
