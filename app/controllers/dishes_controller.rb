class DishesController < ApplicationController


  def show
    @dish = Dish.find(params[:id])
    @ingredients = @dish.ingredients
    @dish_total_calories = @dish.total_calories
    @dish_chef_name = @dish.dish_chef_name
  end
end