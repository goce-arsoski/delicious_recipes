class RecipesController < ApplicationController
  skip_before_action :require_login, only: [:index]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  def show
  end

  def new
    @recipe = Recipe.new
    6.times { @recipe.instructions.build }
    8.times { @recipe.ingredients.build }
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
    3.times { @recipe.instructions.build }
    3.times { @recipe.ingredients.build }
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description,
                                   instructions_attributes: [:id, :step, :_destroy],
                                   ingredients_attributes: [:id, :name, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
