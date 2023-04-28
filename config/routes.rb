Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/clientes" , to: "clientes#index"
  get "/user" , to: "user#index"
  get "/home", to: "home#welcome"
  get '/vehicles/new', to: 'vehicles#new', as: 'new_vehicle'
  
  Rails.application.routes.draw do
    resources :vehicles
  end
  
end
