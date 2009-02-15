ActionController::Routing::Routes.draw do |map|
  map.resources :slugs
  map.resources :visitors
  map.resources :links
  map.resources :messages

  map.about '/about', :controller => 'about'
  map.services '/services', :controller => 'services'

  map.root :controller => 'welcome'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.connect '/preview/:id', :controller => 'link', :action => 'preview'
  map.connect '/:id', :controller => 'link', :action => 'go'
end
