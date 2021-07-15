class RecipesController < ApplicationController
  before_action :authenticate_user!

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
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
    @genre1 = Recipe.where(genre_id: 1 )  # 和食
    @genre2 = Recipe.where(genre_id: 2 )  # 洋食
    @genre3 = Recipe.where(genre_id: 3 )  # 中華
    @genre4 = Recipe.where(genre_id: 4 )  # アジア/エスニック
    @genre5 = Recipe.where(genre_id: 5 )  # その他
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients_ids = @recipe.recipe_ingredients.pluck(:ingredient_id) # 中間テーブルからレシピの材料idをpick up
    @ingredients = Ingredient.where(id: @ingredients_ids)               # 材料テーブルからそのレシピの材料idをもつ材料をpick up
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @genres = Genre.all
    @recipe.recipe_ingredients.build
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
                                   ingredients_attributes: [:name, :unit, :quantity])
  end

end
