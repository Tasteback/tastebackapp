class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
  def search
    @allergies = Allergy.all.order('name ASC')
  end
  def search_results
    @dishes = Dish.where(nil)
    if search_params[:allergies] 
        @dishes = @dishes.includes_allergies(search_params[:allergies]) if search_params[:allergies].any?
    end
    @restaurants = []
    @dishes.each do |d|
      @restaurants << d.restaurant
    end 
    dish_ids = @dishes.map { |d| d.id }
    session[:dishes] = dish_ids
    @restaurants = @restaurants.near(params[:location], params[:distance])
  end
  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = Dish.where(id: session[:dishes])
    @dishes = @dishes.restaurant(@restaurant.id)
  end

  private
  def search_params
    params.permit(:location, :distance, :allergies => [])
  end
end

