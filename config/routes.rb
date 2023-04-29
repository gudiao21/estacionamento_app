Rails.application.routes.draw do
  root 'home#welcome'
  get '/home/entrada', to: 'vehicles#entrada', as: 'nova_entrada'
end