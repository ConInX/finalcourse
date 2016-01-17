Rails.application.routes.draw do
  get 'kindeditor/images_list'
  post 'kindeditor/upload'
  
  get 'commentsbyauser/commentsbyauser'
  post 'commentsbyauser/commentsbyauser'
  
  get 'user_course/details1'
  post 'user_course/details'
  
  get 'commentsbyauser/delete'
  post 'commentsbyauser/delete'
  
  get 'logout/logout'
  post 'logout/logout'

  get 'articlesbyauser/articlesbyauser'

  get 'articlesbyauser/articlesbyauser'
  post 'articlesbyauser/articlesbyauser'
  
  get 'articlesbyauser/delete'
  post 'articlesbyauser/delete'

  get 'article/article'
  post 'article/article'

  get 'user_course/user_course'

  get 'login/login'
  post 'login/login'
  
  get 'login/index'
  post 'login/index'
  
  get 'user_course/new'
  post 'user_course/new'
  
  get 'user_course/details'
  post 'user_course/details'
  
  get 'user_course/add'
  post 'user_course/add'
  
  get 'user_course/delete'
  post 'user_course/delete'
  
  get 'user_course/addbyself'
  post 'user_course/addbyself'
  
  get 'article/newarticle'
  post 'article/newarticle'
  
  get 'article/details'
  post 'article/details'
  
  
  get 'article/newcomment'
  post 'article/newcomment'
  
  root "login#login"
  
  

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
