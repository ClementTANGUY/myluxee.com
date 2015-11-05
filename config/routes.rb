Rails.application.routes.draw do

  get 'stores/show'

  get 'welcome/terms_and_conditions'

  get 'welcome/privacy_policy'

  get 'dashboard/index'

  devise_for :accounts, controllers: {registrations: "accounts"}
  resources :accounts, controller: "accounts"

  get "auth/:provider/callback" => "my_omniauth#create"

  # get "accounts/auth/:provider(.:format)", to: "accounts_omniauth#passthru {:provider=>/(?!)/}"
  # get "accounts/auth/:action/callback(.:format)", to: "accounts_omniauth#(?-mix:(?!))"

  devise_for :sales_associates, controllers: { registrations: "sales_associates"}
  resources :sales_associates, controller: "sales_associates" do
    resource :sales_associate_news, only: [:create, :destroy], controller: "sales_associates/news"
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

  resources :stores, only: :show

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
