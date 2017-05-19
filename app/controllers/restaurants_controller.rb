class RestaurantsController < ApplicationController
  def search
    @allergies = Allergy.all.order('name ASC')
  end
  def search_results
    @dishes = Dish.where(nil)
    if search_params[:allergies] || search_params[:user_allergies]
      if search_params[:allergies]
        @dishes = @dishes.includes_allergies(search_params[:allergies]) if search_params[:allergies].any?
      elsif search_params[:user_allergies]
        @dishes = @dishes.includes_allergies(current_user.allergies)
      end
      restaurant_ids = @dishes.map { |d| d.restaurant.id }
      @restaurants = Restaurant.where(id: restaurant_ids)
      dish_ids = @dishes.map { |d| d.id }
      session[:dishes] = dish_ids
    else
      @restaurants = Restaurant.all
      session.delete(:dishes)
    end
    @geo = false
    if !params[:location].empty? && !params[:distance].empty?
     @restaurants = @restaurants.near(params[:location], params[:distance]) 
     @geo = true
    end

    #user_allergies thing
  end
  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    @reviews = @restaurant.reviews.order(:created_at)
    if session[:dishes]
      @dishes = Dish.where(id: session[:dishes])
      @dishes = @dishes.restaurant(@restaurant.id)
    else 
      @dishes = @restaurant.dishes
    end
  end

  private
  def search_params
    params.permit(:location, :distance, :user_allergies, :allergies => [])
  end
end

