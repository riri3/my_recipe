class WeeklyMenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @weekly_menus = WeeklyMenu.all
  end
end
