Rails.application.routes.draw do
  get 'welcome/terms_and_conditions'

  get 'welcome/privacy_policy'

  get 'dashboard/index'

  devise_for :sales_associates, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "sales_associates"}
  resources :sales_associates do
    resources :stores, controller: "sales_associates/stores" do
      member do
        post 'create_position'
        delete 'finish_position'
        delete 'destroy_position'
        post 'undo_position'
        post 'create_news'
        delete 'destroy_news'
        get 'new_position'
        get 'edit_position'
      end
    end
  end

  post 'sales_associates_news' => 'sales_associates/news#create'

  resources :stores

  get 'welcome/locate'

  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
