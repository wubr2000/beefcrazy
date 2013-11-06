class RestaurantController < ApplicationController

  def new
    # Do something
    @restaurants = Restaurant.all.entries
  end

  def create

    @restaurants = Restaurant.all.entries
    # is the restaurant name blank?
    if !params[:restaurant][:name].blank?
      @restaurant = Restaurant.new
      @restaurant.id = SecureRandom.urlsafe_base64
      @restaurant.name = params[:restaurant][:name]
      @restaurant.address = params[:restaurant][:address]      
      @restaurant.review = params[:restaurant][:review]
      @restaurant.author = current_user.name
      @restaurant.save

      @restaurants = Restaurant.all.entries

      render :new
      flash.now[:notice] = "Thank you for your review. Your comments have been posted."
    else
      flash.now[:error] = "Please put in restaurant's name."
      render :new
    end

  end

end