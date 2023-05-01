Rails.application.routes.draw do
  root 'home#welcome'
  get '/vehicles/new', to: 'vehicles#new', as: 'new_vehicle'
end