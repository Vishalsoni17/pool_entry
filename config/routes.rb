Rails.application.routes.draw do
  resources :customers do
    get 'history', on: :collection
    get 'entry_out', on: :member
    get 'detailed_status', on: :collection
    get 'delete_all_customers', on: :collection
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "customers#index"
end
