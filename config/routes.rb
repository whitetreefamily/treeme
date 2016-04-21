Rails.application.routes.draw do

  get 'admin_sessions/admin_tree'
  get 'admin_sessions/admin_user'
  get 'admin_sessions/admin_category'
  get 'admin_sessions/new'
  resources :admin_sessions
  resources :admins
  get 'change_admin' => 'admins#change_admin'
  patch 'change_admin' => 'admins#change_admin'
  get 'admins/password'
  resources :infos
  get "/404" => "errors#not_found"
  get "/500" => "errors#internal_server_error"

  resources :branches do
    member do
      get 'looking'
    end
  end

  resources :articles do
    member do
      get 'delete'
    end
  end

  resources :comments
  resources :categories

  resources :pages do
    member do
      get 'vote'
      get 'delete_page'
    end
  end
  get 'pages/page_info'
  resources :articles do
    resources :comments
  end

  resources :contestants
  get "admin_out" => "admin_sessions#destroy", :as => "admin_out"
  get "log_out" => "passbys#destroy", :as => "log_out"
  get "log_in" => "passbys#form", :as => "log_in"
  get "sign_up" => "users#form", :as => "sign_up"
  resources :passbys


  get 'announcements/:id/hide', to: 'announcements#hide', as: 'hide_announcement'
  resources :users do
    member do
      get :confirm_email
    end
  end
  get 'user_setting/suggestion'
  get 'user_setting/image'
  get 'user_setting/password'
  get 'user_setting/tree'
  get 'user_setting/branching'
  get 'user_setting/index'
  resources :password_resets
  get 'change_password' => 'users#change_password'
  patch 'change_password' => 'users#change_password'

  get 'welcome/image'
  get 'welcome/tour'
  get 'welcome/meta'
  get 'welcome/index'
  get "welcome/show"
  root 'welcome#index'
  get 'welcome/goodbey50007'
  get 'admins/admin_branch'


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
  #     #     resources :sales do
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
