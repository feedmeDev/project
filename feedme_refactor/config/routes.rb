Rails.application.routes.draw do
  resources :indications

  resources :attendances

  resources :component_meals

#  resources :meals

  resources :components

  resources :people

  
  #custom routes
  
  #session controller
  #login staff
  post '/login/staff' => 'sessions#login_staff'
  #login customer
  post '/login/customer' => 'sessions#login_customer'
  #log out
  post '/logout' => 'sessions#logout'

  #people controller
  #get staff
  get '/staff' => 'people#index_staff'
  #get customers
  get '/customers' => 'people#index_customers'

  #get an individual person
  get '/person' => 'people#show'

  #create person
  post '/person' => 'people#create'
  #edit an individual person
  put '/person' => 'people#update'

  #meal controller
  #get meals past deadline
  get '/meals/past_deadline' => 'meals#get_meals_past_deadline'
  #get future meals
  get '/meals/future' => 'meals#get_future_meals'
  #get past meals
  get '/meals/past' => 'meals#get_past_meals'
  #get all meals on date
  get '/meals/date' => 'meals#get_meals_on_date'
  
  #get specific meal
  get '/meals' => 'meals#show'
  #create a meal
  post '/meals' => 'meals#create'
  #update a meal
  put '/meals' => 'meals#update'
  #delete a meal
  delete '/meals' => 'meals#destroy'

  #add a list of components to a meal
  post '/meals/components' => 'meals#set_components_for_meal'
  #remove a component from a meal
  delete '/meals/component' => 'meals#remove_component_from_meal'
  #get components for meal
  get '/meals/component' => 'meals#get_components_for_meal'

  #attendances controller
  #get specific persons attendances for a meal
  get '/attendances/person' => 'attendances#get_attendances_for_person'
  #get report
  get '/report' => 'attendances#report'
  #create attendances
  post '/attendances' => 'attendances#create'
  #get indications for a person on a meal
  get '/indications' => 'attendances#get_indications'

  #components controller
  #get individual component
  get '/component' => 'components#show'
  #get all components
  get '/components' => 'components#index'
  #create a component
  post '/component' => 'components#create'
  #edit a component
  put '/component' => 'components#update'

  #pages
  get '/index', :to => redirect('index.html')


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
