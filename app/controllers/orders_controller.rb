class OrdersController < ApplicationController
  before_action :is_authenticated?

  def index
    @users = User.all.entries
  end

  def create
      # NOTHING
  end

  def update
    # puts "update order"

    @user = current_user

    if params.include?(:amount)
      @user.order = params[:amount]
    end

    @user.save

    render json: {
      order: @user.order
    }
  end

  def show
  end

  def destroy
  end

end