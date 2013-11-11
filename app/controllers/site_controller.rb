class SiteController < ApplicationController
  # before_action :is_authenticated?, only: [ :index ]
  
  def index
    @users = User.all.entries

    if current_user
    	render 'logged_in'
    else
    	render 'index', layout: "layouts/landing"
    end
  end

  def logged_in
    @users = User.all.entries
  end
  
  def privacy
    
  end
  
  def terms
    
  end
end

