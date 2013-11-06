class SubscriptionController < ApplicationController
  
  def create
    # Build Subscriber model - done
    @subscriber = Subscriber.create(email: params[:subscriber][:email])

    
    if @subscriber.save
      
      UserMailer.subscribe_email(@subscriber, request).deliver
      
      render :new, layout: "layouts/landing"
    
    else
      
      redirect_to root_url
    end
  
  end


end
