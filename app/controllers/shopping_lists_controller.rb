class ShoppingListsController < ApplicationController
  def index
    @weekly_menus = WeeklyMenu.all
  end
end
