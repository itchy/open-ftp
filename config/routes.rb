Openftp::Application.routes.draw do
  match 'public/' => 'public#index'
  match '/sms' => 'public#sms', :via => [:get, :post]
  match '/intro' => 'public#intro', :via => [:get, :post]
  root :to => 'public#index'
  # session
  match 'session/register' => 'session#register'
  match 'session/create' => 'session#create'
  match 'session/login' => 'session#login'
  match 'session/logout' => 'session#logout'
  
  #box_files
  match 'box_files/' => 'box_files#index'
  match 'box_files/watch/:file_id/:name' => 'box_files#watch'
  match 'box_files/unwatch/:file_id' => 'box_files#unwatch'
  match 'box_files/togle_notify/:file_id' => 'box_files#togle_notify'
  match 'box_files/increment_downloads/:file_id' => 'box_files#increment_downloads'
  
  resources :users

  
  match 'box/token' => 'box#token'
  
  match 'downloads/:url_code' => 'downloads#download_box_file'
  # match 'downloads/' => 'downloads#show'
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
