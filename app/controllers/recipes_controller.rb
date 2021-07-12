class RecipesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build #ネスト
    # @recipe.recipe_ingredients.ingredients.build
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
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
    params.require(:recipe).permit(:genre_id, :name, :step, :image,
                                   recipe_ingredients_attributes: [:id, :recipe_id, :ingredient_id, :quantity, :_destroy,
                                   ingredient_attributes:[:name, :unit]])
  end

end
