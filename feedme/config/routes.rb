Feedme::Application.routes.draw do
  resources :components_meals

  resources :indication_for_meals

  resources :attendances

  resources :feedback_for_meals

  resources :component_meals

  resources :meals

  resources :components

  resources :allergen_components

  resources :allergen_warnings

  resources :bug_reports

  resources :people


  # See how all your routes lay out with "rake routes".

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  #==================================================================
  #start custom routes

  #allergen_warnings
  #all auto generated ones work

  #person, auto gen working
  #get /people - return json list of people
  #get /people/:id - gets a person

  #list all
  get '/staff' => 'people#index_staff'
  get '/students' => 'people#index_students'
  
  #create person
  post '/staff' => 'people#create_staff'
  post '/student' => 'people#create_student'

  #reactivate person
  put '/people/reactivate/:id' => 'people#reactivate'

  #login
  post '/staff/login' => 'people#login_staff'
  post '/student/login' => 'people#login_student'




  #meals
  get '/meal/future' => 'meals#get_future_meals'
  get '/meal/past' => 'meals#get_past_meals'
  get '/meal/deadline_past' => 'meals#get_meals_past_deadline'

  #components to meal relationship
  post '/meal/add_component' => 'meals#add_items_to_meal'
  delete '/meal/delete_component' => 'meals#remove_items_from_meal'
  

  #get components for a meal
  get '/meal/components' => 'meals#get_components_for_meal'

  #get meal by date
  get '/meal/by_date' => 'meals#get_meals_on_date'

  #report for meal
  get '/get_report/:id' => 'attendances#get_report'

  





  #pages
  get '/index', :to => redirect('index.html')
end










