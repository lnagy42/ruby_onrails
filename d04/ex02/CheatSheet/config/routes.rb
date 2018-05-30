Rails.application.routes.draw do
  root 'welcome#convention'
  get 'convention' => 'welcome#convention'
  get 'console' => 'welcome#console'
  get 'editor' => 'welcome#editor'
  get 'help' => 'welcome#help'
  get 'rails' => 'welcome#rails'
  get 'ruby' => 'welcome#ruby'
  get 'rails-erb' => 'welcome#rails_erb'
  get 'rails-commands' => 'welcome#rails_commands'
  get 'rails-folder-structure' => 'welcome#rails_folder_structure'
  get 'ruby-arrays' => 'welcome#ruby_arrays'
  get 'ruby-concepts' => 'welcome#ruby_concept'
  get 'ruby-strings' => 'welcome#ruby_strings'
  get 'ruby-numbers' => 'welcome#ruby_numbers'
  get 'ruby-hashes' => 'welcome#ruby_hashes'
  get 'quick-search' => 'welcome#quick_search'


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
