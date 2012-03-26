Dating::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root              :to => 'pages#home'

  match '/login',   :to => 'pages#home'
  match '/signup',  :to => 'pages#home'
  match '/inbox',   :to => 'messages#index', :as => :inbox
  match '/outbox',  :to => 'messages#outbox', :as => :outbox
  match '/message/:id', :to => 'messages#show'
  match '/user/:id', :to => 'users#show'
  match '/user/:id/search', :to => 'users#search'

  resources :users do
    member do
      get :home
      get :matches, :interested
      get :find_matches
      resources :interests
    end
    resources :messages
  end
  
  #match 'inbox/:id',  :to => 'messages#index'

  resources :sessions, only: [:create, :destroy]
  resources :relationships, except: [:edit, :update] # matches
 
  
  # match '/logout',  :to => 'sessions#destroy', :via  => :delete, :as => :logout

  resources :messages, :singular => :message

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  #match 'inbox' => 'message#index'

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

  # See how all your routes lay out with "rake routes"
  match '/:controller(/:action(/:id))(.:format)'
end
