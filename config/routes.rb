ActionController::Routing::Routes.draw do |map|
  map.root :controller => :posts
  map.resources :posts, :only => [:index, :show], :collection => [:feed] do |post|
    post.resources :comments, :only => [:create]
  end
  map.resources :users
  map.resources :user_sessions
  
  map.namespace :admin do |admin|
    admin.root :controller => "index"
    admin.resources :posts
  end
  
  map.feed 'feed', :controller => "posts", :action => "feed"

  map.year_archive 'posts/:year/', :controller => "posts", :action => "archive"
  map.archive 'posts/:year/:month', :controller => "posts", :action => "archive"
  map.dated_post ':year/:month/:day/:id', :controller => "posts", :action => "show"
  
  map.register 'register', :controller => "users", :action => "new"
  map.login 'login', :controller => "user_sessions", :action => "new"
end
