Rails.application.routes.draw do
  root 'home#welcome', as: 'welcome'
  get '/vehicles/new', to: 'vehicles#new', as: 'new_vehicle'
  #Em 'to: 'vehicles#new' 'new' é o nome do método(def) dentro de vehicls_controller.rb
  #E 'vehicles' é o nome do controller.
  get '/saidas/new', to: 'saidas#new', as: 'new_saida'
end