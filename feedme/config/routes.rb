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
  
  post '/staff' => 'people#create_staff'
  post '/student' => 'people#create_student'




end
