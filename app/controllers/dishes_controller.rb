class DishesController < ApplicationController


  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
    @dish_total_calories = @dish.total_calories
    @dish_chef_name = @dish.dish_chef_name
  end

  def create
    dish = Dish.find(params[:id])
    ingredient = Ingredient.find(params[:ingredient_id])
    DishIngredient.create!(dish: dish, ingredient: ingredient)
    redirect_to "/dishes/#{dish.id}"
  end
end