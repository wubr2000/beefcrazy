class RestaurantsController < ApplicationController

  def edit
    @restaurant = Restaurant.find(params[:id])
    @current_user = User.find_by(id: session[:user_id]).name
    
    if @restaurant.author != @current_user
      redirect_to restaurants_url, notice: "You are not the author of this review. You can only edit reviews that you have created."
    end
    # @restaurant_locations = Restaurant.find(params[:id]).address
  end

  def update
    # Updating 
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update_attributes(restaurant_strong_params)
    redirect_to restaurants_url
  end

  def index
    @restaurants = Restaurant.all.entries
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    redirect_to edit_restaurant_path
  end
  
  def new
    
    @restaurant = Restaurant.new
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # @comment = @restaurant.comment.create(params[:comment].permit(:commenter, :remark))
  end

  def create
    # is the restaurant name blank?
    if !params[:restaurant][:name].blank?
      @restaurant = Restaurant.new(restaurant_strong_params)
      @restaurant.id = SecureRandom.urlsafe_base64
      @restaurant.author = current_user.name
      @restaurant.save

      redirect_to restaurants_url, notice: "Thank you for your review. Your comments have been posted."
    else
      redirect_to new_restaurant_path, notice: "Please put in restaurant's name."
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @current_user = User.find_by(id: session[:user_id]).name

    if @restaurant.author != @current_user
      redirect_to restaurants_url, notice: "You are not the author of this review. You can only delete reviews that you have created."
    else
      @restaurant.comments.destroy_all
      @restaurant.destroy
      redirect_to restaurants_url, notice: 'Review was successfully deleted.'
    end

  end

  private

  def restaurant_strong_params
    params.require(:restaurant).permit(
      :name,
      :address,
      :review
    )
  end


end
