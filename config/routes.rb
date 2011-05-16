Merlot::Application.routes.draw do

  resources :articles

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :admin

  resources :home, :only => :index
  resources :admins, :only => :index
  resources :feedbacks, :only => [:new, :create]
  resources :submissions, :only => [:new, :create] 
  
  root :to => 'home#index'

  match '/token' => 'home#token', :as => :token
end
