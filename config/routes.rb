ActionController::Routing::Routes.draw do |map|
  map.root :controller => :posts
  map.resources :posts
  map.resources :users
end
