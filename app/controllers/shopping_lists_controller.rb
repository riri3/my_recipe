# frozen_string_literal: true

class ShoppingListsController < ApplicationController
  def index
    @memo = current_user.shopping_lists.new
    @memos = current_user.shopping_lists.all

    now = Time.current

    if params[:target] == "previous_week" # 先週１週間の献立で使われる材料を取得
      @previous_from = now.prev_week(:monday)
      @previous_to = now.prev_week(:sunday)
      @last_week = current_user.daily_menus.where(start_time: @previous_from...@previous_to)

      recipe_ids = []
      @last_week.each do |menu|
        recipe = menu.recipe
        recipe_ids << recipe.id
      end

      @ingredient_ids = RecipeIngredient.where(recipe_id: recipe_ids).pluck(:ingredient_id)
      @ingredients = Ingredient.where(id: @ingredient_ids).order(name: :ASC)

    elsif params[:target] == "next_week" # 翌週１週間の献立で使われる材料を取得
      @next_from = now.next_week(:monday)
      @next_to = now.next_week(:sunday)
      @next_week = current_user.daily_menus.where(start_time: @next_from...@next_to)

      recipe_ids = []
      @next_week.each do |menu|
        recipe = menu.recipe
        recipe_ids << recipe.id
      end

      @ingredient_ids = RecipeIngredient.where(recipe_id: recipe_ids).pluck(:ingredient_id)
      @ingredients = Ingredient.where(id: @ingredient_ids).order(name: :ASC)

    elsif params[:target] == "this_week" # 今週１週間の献立で使われる材料を取得
      # 今週の週間献立すべてを取得
      @from = now.beginning_of_week
      @to = now.end_of_week
      @this_week = current_user.daily_menus.where(start_time: @from...@to)

      # 今週の週間献立に登録されているレシピを取得
      recipe_ids = []
      @this_week.each do |menu|
        recipe = menu.recipe
        recipe_ids << recipe.id
      end

      # 中間テーブルからレシピの材料idを取得
      @ingredient_ids = RecipeIngredient.where(recipe_id: recipe_ids).pluck(:ingredient_id)
      # 材料テーブルからそのレシピの材料idをもつ材料を取得
      @ingredients = Ingredient.where(id: @ingredient_ids).order(name: :ASC)

    else
      # 今週の週間献立すべてを取得
      @from = now.beginning_of_week
      @to = now.end_of_week
      @this_week = current_user.daily_menus.where(start_time: @from...@to)

      # 今週の週間献立に登録されているレシピを取得
      recipe_ids = []
      @this_week.each do |menu|
        recipe = menu.recipe
        recipe_ids << recipe.id
      end

      # 中間テーブルからレシピの材料idを取得
      @ingredient_ids = RecipeIngredient.where(recipe_id: recipe_ids).pluck(:ingredient_id)
      # 材料テーブルからそのレシピの材料idをもつ材料を取得
      @ingredients = Ingredient.where(id: @ingredient_ids).order(name: :ASC)
    end
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
    flash[:alert] = 'メモを削除しました'
    redirect_to shopping_lists_path
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:user_id, :memo)
  end
end
