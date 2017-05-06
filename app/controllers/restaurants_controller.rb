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
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private
  def search_params
    params.permit(:zip_code, :allergies => [])
  end
end

