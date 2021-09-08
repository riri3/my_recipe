# frozen_string_literal: true

class ShoppingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    @memo = current_user.shopping_lists.new
    @memos = current_user.shopping_lists.all

    now = Time.current
    # 先週の献立
    @previous_from = now.prev_week(:monday)
    @previous_to = now.prev_week(:sunday)
    @last_week_menus = current_user.daily_menus.where(start_time: @previous_from...@previous_to)

    # 来週の献立 
    @next_from = now.next_week(:monday)
    @next_to = now.next_week(:sunday)
    @next_week_menus = current_user.daily_menus.where(start_time: @next_from...@next_to)

    # 今週の献立
    @from = now.beginning_of_week
    @to = now.end_of_week
    @this_week_menus = current_user.daily_menus.where(start_time: @from...@to)
  end

  def create
    @memo = current_user.shopping_lists.new(shopping_list_params)
    if @memo.save
      flash[:notice] = '新しいメモを登録しました！'
      redirect_to shopping_lists_path
    else
      flash.now[:alert] = '登録内容が正しくありません'
      render :index
    end
  end

  def show
    @memo = current_user.shopping_lists.find(params[:id])
  end

  def destroy
    @memo = current_user.shopping_lists.find(params[:id])
    @memos = current_user.shopping_lists.all
    @memo.destroy
    flash[:notice] = 'メモを削除しました'
    redirect_to shopping_lists_path
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:user_id, :memo)
  end
end
