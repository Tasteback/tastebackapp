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
        if !current_user.allergies.empty?
          @dishes = @dishes.includes_allergies(current_user.allergies)
        else
          @dishes = Dish.all
        end
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

  def edit
    @restaurant = Restaurant.find(params[:id])
    @allergies = Allergy.all
    if @restaurant.dishes.nil?
      @dishes = @restaurant.dishes.build
    else
      @dishes = @restaurant.dishes
    end
  end

  def new 
    @restaurant = Restaurant.new
    @restaurant.dishes.build
    @allergies = Allergy.all

  end

   def create
    begin
       @restaurant = Restaurant.create(name: restaurant_params[:name],
        cuisine: restaurant_params[:cuisine], 
        address: restaurant_params[:address],
        area: restaurant_params[:area],
        price_range: restaurant_params[:price_range],
        hours: restaurant_params[:hours], 
        url: restaurant_params[:url],
        phone_number: restaurant_params[:phone_number])
       if restaurant_params[:dishes_attributes]
         restaurant_params[:dishes_attributes].each do |k, d|
          @dish = @restaurant.dishes.build(name: d[:name])
          @dish.save
          @dish.allergies << Allergy.where(id: d[:allergies]) if d[:allergies]
         end
       end
       if restaurant_params[:photo]
         @photo = @restaurant.photos.build(image: restaurant_params[:photo]) 
         @photo.save
       end
       flash[:success] = "Restaurant added."
       redirect_to @restaurant
     rescue Exception => e
      p e
      flash[:failure] = "Adding restaurant failed."
      redirect_to :root
     end
   end

  def update

    begin
      @restaurant = Restaurant.find(params[:id])
      @restaurant.update_attributes(name: restaurant_params[:name],
          cuisine: restaurant_params[:cuisine], 
          address: restaurant_params[:address],
          area: restaurant_params[:area],
          price_range: restaurant_params[:price_range],
          hours: restaurant_params[:hours], 
          url: restaurant_params[:url],
          phone_number: restaurant_params[:phone_number])
      if restaurant_params[:dishes_attributes]
         restaurant_params[:dishes_attributes].each do |k, d|
          if d[:_destroy] ==  "1"
            @restaurant.dishes.delete(Dish.find(d[:id]))
          elsif d[:id]
            @dish = Dish.find(d[:id])
            @dish.update_attributes(name: d[:name])
            @dish.save
            @dish.allergies = Allergy.find(d[:allergies])
          else
            @dish = @restaurant.dishes.build(name: d[:name])
            @dish.save
            @dish.allergies << Allergy.where(id: d[:allergies]) if d[:allergies]
          end
         end
       end
     if restaurant_params[:photo]
        @photo = @restaurant.photos.build(image: restaurant_params[:photo]) 
        @photo.save
      end
      flash[:success] = "Restaurant edited!"
      redirect_to @restaurant
    rescue Exception => e
      p e
      flash[:failure] = "Editing restaurant failed."
      redirect_to @restaurant
    end
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "Restaurant deleted"
    redirect_to :root
  end

  private
  def restaurant_params 
    params.require(:restaurant).permit(:name, :cuisine, :address, :area, :price_range, :hours, :url, :phone_number, :photo, {dishes_attributes: [:id, :name, :_destroy, allergies: []] })
  end
  def search_params
    params.permit(:location, :distance, :user_allergies, :allergies => [])
  end
end

