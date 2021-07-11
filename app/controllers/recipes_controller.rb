class RecipesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # @ingredient = Ingredient.new(ingredient_params)
    # @ingredient.save
    if @recipe.save
      flash[:notice] = "新しいレシピを登録しました！"
      redirect_to recipe_path(@recipe.id)
    else
      render :new
    end

  end

  def index
    @recipes = Recipe.all
    @genres = Genre.all
    @ingredients = Ingredient.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @genres = Genre.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @genres = Genre.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:notice] = "登録情報を変更しました!"
      redirect_to recipe_path(@recipe.id)
    else
      render 'edit'
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(, :genre_id, :name, :step, :image)
  end

  # def ingredient_params
  #   params.require(:ingredient).permit(:name, :unit)
  # end

end
