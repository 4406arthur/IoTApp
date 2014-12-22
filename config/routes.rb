Rails.application.routes.draw do
  #mount Dashing::Engine, at: Dashing.config.engine_path
   resources :swot_users, :shallow => true do
    resources :plant_walls do
      resources :suggestions
      resources :devices
      resources :harvest_points
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'swot_users#show'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/creation', to:'devices#create',  via: 'get'
  match '/logout', to:'swot_users#logout', via: 'get'
  match '/plant_walls/:plant_wall_id/chart' => 'devices#chart', :as => :chart, via: 'get'
  #match '/plant_walls/:plant_wall_id/streamPath' => 'devices#newPath', :as => :chart, via: 'put'
  match '/plant_walls/:plant_wall_id/pic' => 'devices#pic', :as => :pic, via: 'get'
  match '/plant_walls/:plant_wall_id/cam' => 'devices#cam', :as => :cam, via: 'get'
  match '/plant_walls/:plant_wall_id/dash' => 'devices#dash', :as => :dash, via: 'get'
  match '/plant_walls/:swot_user_id/list' => 'plant_walls#listDevice', via: 'get'
  #get '/find' => 'devices#chart'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
