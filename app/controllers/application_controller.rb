class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user
  
  def current_user
    @current_user ||= User.find_or_create_by(id: session[:user_id])
  end
  
  def is_authenticated?
    redirect_to login_url unless current_user
  end
end
