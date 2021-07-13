class WeeklyMenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_menus = DailyMenu.all
  end
end
