Merlot::Application.routes.draw do
  
  get "errors/4oh4"

  get "errors/5oh0"

  get "accounts/index"

  resources :articles

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :admin

  resources :home, :only => :index
  resources :admins, :only => :index
  resources :feedbacks, :only => [:new, :create]
  resources :submissions, :only => [:new, :create] 

  root :to => 'home#index'

  match '/token' => 'home#token', :as => :token
  
  match '*a', :to => 'errors#4oh4'
end
