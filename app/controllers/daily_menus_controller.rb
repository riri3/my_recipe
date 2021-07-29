# frozen_string_literal: true

class DailyMenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @daily_menu = current_user.daily_menus.new
    @daily_menus = current_user.daily_menus.all.order(start_time: :ASC, meal_time_id: :ASC)
  end

  def create
    @daily_menu = current_user.daily_menus.new(daily_menu_params)
    if @daily_menu.save
      flash[:notice] = '献立に登録しました！'
      redirect_to daily_menus_path
    else
      flash.now[:alert] = '登録内容が正しくありません'
      render :new
    end
  end

  def show
    now = Time.current
    @from = now.beginning_of_day
    @to = now.end_of_day
    @daily_menus = current_user.daily_menus.where(start_time: @from...@to)
  end

  def edit
    @daily_menu = current_user.daily_menus.find(params[:id])
  end

  def update
    @daily_menu = current_user.daily_menus.find(params[:id])
    if @daily_menu.update(daily_menu_params)
      flash[:notice] = '登録情報を変更しました!'
      redirect_to daily_menus_path
    else
      render 'edit'
    end
  end

  def destroy
    daily_menu = current_user.daily_menus.find(params[:id])
    daily_menu.destroy
    redirect_to daily_menus_path
  end

  private

  def daily_menu_params
    params.require(:daily_menu).
      permit(:user_id, :recipe_id, :weekly_menu_id, :start_time, :meal_time_id, :memo)
  end
end
