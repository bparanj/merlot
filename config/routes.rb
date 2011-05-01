Merlot::Application.routes.draw do
  devise_for :users, :admin

  resources :home, :only => :index
  resources :admins, :only => :index
  resources :feedbacks, :only => [:new, :create]

  root :to => 'home#index'

  match '/token' => 'home#token', :as => :token
  
end
