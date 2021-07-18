class WeeklyMenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_menus = current_user.daily_menus.all.order(meal_time_id: :ASC)
  end
end
