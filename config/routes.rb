ActionController::Routing::Routes.draw do |map|
  map.root :controller => :posts
  map.resources :posts, :only => [:index, :show]
  map.resources :users
  map.resources :user_sessions
  
  map.namespace :admin do |admin|
    admin.root :controller => "index"
    admin.resources :posts
  end
  
  map.login 'login', :controller => "user_sessions", :action => "new"
end
