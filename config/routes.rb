ActionController::Routing::Routes.draw do |map|
  map.about '/about', :controller => 'about'
  map.services '/services', :controller => 'services'
  map.contact '/contact', :controller => 'contact'

  map.root :controller => 'welcome'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
