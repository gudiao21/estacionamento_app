Rails.application.routes.draw do
  get '/home/entrada', to: 'vehicles#entrada', as: 'nova_entrada'
end