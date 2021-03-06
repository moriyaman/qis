Rails.application.routes.draw do

  root to: 'home#index'

  resources :categories
  resources :questions

  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks" }

  get 'tests' => 'tests#index'
  get 'tests/:category_id' => 'tests#start', as: 'tests_start'

  get 'ranking/index' => 'ranking#index', as: 'ranking_index'
  get 'ranking/show/:category_id' => 'ranking#show', as: 'ranking_show'

  # apis
  get 'apis/next_question' => 'apis#next_question'
  post 'apis/finish_test' => 'apis#finish_test'
  get 'apis/category_auto_comp' => 'apis#category_auto_comp'
  
  # profiles
  get 'profiles/edit' => 'profiles#edit', as: 'profile_edit'
  post 'profiles/update' => 'profiles#update'

  namespace :apis do
    resources :answers
  end
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
