class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]
  def create
    @restaurant = Restaurant.find(review_params[:restaurant_id])
    @review = current_user.reviews.build(review_params)
    if @review.save 
      flash[:success] = "Review published!"
      redirect_to @restaurant
    else
      flash[:error] = "Error publishing review."
      render @restaurant
    end
  end

  def destroy
    @r = Review.find(params[:id])
    @restaurant = @r.restaurant 
    @r.destroy
    flash[:success] = "Review deleted."
    redirect_to @restaurant
  end

  private
  def review_params 
    params.require(:review).permit(:text, :rating, :restaurant_id)
  end
  def correct_user
    @review = current_user.reviews.find(params[:id])
    redirect_to root_url if @review.nil?
  end
end
