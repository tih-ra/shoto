ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resource :session

  # The priority is based upon order of creation: first created -> highest priority.
  map.root :controller => 'welcome'
  map.resources :posts
  map.resources :events
  map.resources :comments
  map.resources :ourservices
  map.resource :contacts
  map.resources :works
  map.resources :abouts
  map.resource :freeze_frames
  map.resource :photo_art, :controller=>'photo_art'
  map.resource :videos
  map.resource :igogo_uploader, :controller=>'igogo_uploader'
  
  map.logout   '/logout', :controller => 'sessions', :action => 'destroy'
  map.login    '/login', :controller => 'sessions', :action => 'new'
  
  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"
  map.namespace :manage do |manage|
    manage.resources :posts
    manage.resources :albums
    manage.resources :photos
    manage.resources :services
    manage.resources :projects
    manage.resources :videos
    manage.resources :events
    manage.resources :banners
    manage.resources :users
    manage.resources :works
    manage.resources :snd_msgs
    manage.resource :personal_info
    
  end
  # Install the default routes as the lowest priority.
   map.manage "/manage", :controller => "manage/main"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
