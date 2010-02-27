ActionController::Routing::Routes.draw do |map|
  map.root :controller => :posts
  map.resources :posts
  map.resources :users
  map.resources :user_sessions
  
  map.namespace :admin do |admin|
    admin.root :controller => "index"
  end
  
  map.login 'login', :controller => "user_sessions", :action => "new"
end
