Merlot::Application.routes.draw do

  match 'sitemap.xml' => 'sitemaps#sitemap'

  get "errors/fourzerofour"
  get "errors/fivehundred"
  get "accounts/index"

  resources :categories 
  
  resources :articles do
    get 'page/:page', :action => :index, :on => :collection
  end

  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :admin

  resources :home, :only => :index
  resources :admins, :only => :index
  resources :feedbacks, :only => [:new, :create]
  resources :submissions, :only => [:new, :create] 

  root :to => 'home#index'
  
  match '/related/:tag' => 'articles#related', :as => :related_article
  match '/token' => 'home#token', :as => :token
  match '/fb_channel', :controller=>'home', :action=>'fb_channel'
  match '/privacy' => 'home#privacy'
  match '/terms' => 'home#terms'
  match '/feed' => 'articles#feed', :as => :feed, :defaults => { :format => 'atom' }
  
  match '*a', :to => 'errors#fourzerofour'
end
