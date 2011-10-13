Merlot::Application.routes.draw do

  match 'sitemap.xml' => 'sitemaps#sitemap'

  get "errors/fourzerofour"
  get "errors/fivehundred"
  get "accounts/index"

  resources :articles
  resources :categories, :only => [:index, :edit, :update, :new, :create] 

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :admin

  resources :home, :only => :index
  resources :admins, :only => :index
  resources :feedbacks, :only => [:new, :create]
  resources :submissions, :only => [:new, :create] 

  root :to => 'home#index'

  match '/token' => 'home#token', :as => :token
  
  match '*a', :to => 'errors#fourzerofour'
end
