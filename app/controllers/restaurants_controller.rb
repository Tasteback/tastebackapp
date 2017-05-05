class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end
  def search

  end
  def search_results

  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
