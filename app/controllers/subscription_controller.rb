class SubscriptionController < ApplicationController
  def create
    # Build Subscriber model
    @subscriber = Subscriber.new(params[:email])
    
    if @subscriber.save
      # TODO send email
      # Do Noty
      redirect_to root_url, notice: "Thank you for subscribing!"
    else
      # Do Noty
      redirect_to root_url, error: "Something went wrong. Please check your data and try again."
    end
  end
end
