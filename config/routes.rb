Rails.application.routes.draw do
# get 'sponsored_post/edit'

# get 'sponsored_post/index'

# get 'sponsored_post/new'

# get 'sponsored_post/show'

# get 'quetions/index'

# get 'quetions/show'

# get 'quetions/new'

# get 'quetions/edit'

# get 'advertisements/index'

# get 'advertisements/show'

# get 'advertisements/new'

# get 'advertisements/create'

# get 'posts/index'

# get 'posts/show'

# get 'posts/new'

# get 'posts/edit'
 
  resources :advertisements
  resources :idex
#  resources :topics
  resources :topics do
#  resources :posts
   resources :posts, except: [:index]
   resources :sponsored_post
  end
  resources :questions
  
  #get 'welcome/index'

  #get 'welcome/about'
  get 'about' => 'welcome#about'
  
  #get 'welcome/contact'
  
  #get 'welcome/faq'

  root to: 'welcome#index'
  
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