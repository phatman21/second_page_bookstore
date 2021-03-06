Rails.application.routes.draw do
  get 'products/index'

  get 'home/index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'products#index'

  get 'about' => 'information#about', as: 'about'

  get 'contact' => 'information#contact', as: 'contact'

  get '/products/:id' => 'products#show', as: 'singleproduct'

  get 'search_results' => 'products#search_results', as: 'search_results'

  get '/category/:id' => 'categories#index', as: 'category'

  get 'all_products' => 'products#show_all', as: 'allproducts'

  post 'add_to_cart/:id' => 'orders#add_to_cart', as:'add_to_cart'

  post 'remove_from_cart/:id' => 'orders#remove_from_cart', as: 'remove_from_cart'

  get 'view_cart' => 'orders#view_cart', as: 'view_cart'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
