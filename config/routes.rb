Rails.application.routes.draw do
  
  get 'login', to: 'users#login'
  get 'logout', to: 'users#logout'
  post 'validate_login', to: 'users#validate_login'
  
  post 'add_classroom_notification', to: 'teachers#add_classroom_notification'
  post 'send_from_teacher_to_parent', to: 'teachers#send_from_teacher_to_parent'
  post 'send_from_parent_to_teacher', to: 'parents#send_from_parent_to_teacher'
  
  get "pages/index"
  get "pages/about"
  get "pages/contact"
  get "pages/features"
  get "pages/login"
  get "pages/pricing"
  get "pages/register"

  resources :users

  resources :student_results

  resources :exams

  resources :teacher_to_parent_notifications

  resources :parent_to_teacher_notifications

  resources :classroom_notifications

  resources :school_notifications

  resources :teachers do
    member do
      get 'students'
      get 'parent'
      post 'approve'
    end
  end

  resources :parents

  resources :students

  resources :classrooms

  resources :schools do
    member do
     post 'approve'
    end
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
  root :to => "users#root"
end
