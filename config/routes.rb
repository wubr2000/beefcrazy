Beefcrazy::Application.routes.draw do
  
  # Sign in/out
  get    'login' => 'session#new', as: :login
  post   'login' => 'session#create'
  delete 'logout' => 'session#destroy', as: :logout
  
  # Registration
  get  'register/:code' => 'registration#new', as: :register
  post 'register/:code' => 'registration#create'
  
  # Password reset
  get   'reset/:code' => 'password#edit', as: :reset
  put   'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'
  
  get 'privacy' => 'site#privacy'
  get 'terms'   => 'site#terms'
  
  root 'site#index'

  # General subscriber mailer
  post 'subscribe' => 'subscription#create', as: :subscribe

  # resources :restaurant
  # Restaurant Review section
  # get  'restaurant' => 'restaurant#new', as: :restaurant
  # post 'restaurant' => 'restaurant#create'

  #Nested - add a route so that Rails knows where we would like to navigate to see comments 
  resources :restaurants do
    resources :comments
  end

  resources :orders


  # Commenting section
  
end
