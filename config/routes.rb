Rails.application.routes.draw do
  #root 'home#welcome', as: 'welcome'
  get '/welcome', to: 'home#welcome', as: 'welcome'
  get '/vehicles/entrada', to: 'vehicles#entrada', as: 'entrada'
  #Em 'to: 'vehicles#new' 'new' é o nome do método(def) dentro de vehicls_controller.rb
  #E 'vehicles' é o nome do controller.
  post '/vehicles', to: 'vehicles#create', as: 'vehicles'
  get '/saidas/new', to: 'saidas#saida', as: 'new_saida' #Chama o método 'saida'do controlador 'saidas'.
  post '/saidas/new', to: 'saidas#create', as: 'saida'
  get '/busca', to: 'vehicles#search', as: 'search_vehicle'
  #post '/vehicles/delete', to: 'vehicles#delete', as: 'delete_vehicle'
  get '/deletar', to: 'vehicles#procurar_deletar', as: 'delete_form'
  delete '/delete_vehicle/:placa', to: 'vehicles#destroy', as: 'destroy_vehicle'
  post '/search_vehicle', to: 'vehicles#procurar_deletar', as: 'procurar_deletar'
  #delete'/vehicles/:placa', to: 'vehicles#destroy', as: 'destroy_vehicle'
  get 'edit_by_placa/', to: 'vehicles#edit_by_placa', as: 'edit_by_placa_vehicle'
end