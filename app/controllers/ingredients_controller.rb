class IngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @chef_unique_ingredients = @chef.unique_ingredients
  end
end