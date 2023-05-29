Rails.application.routes.draw do
  get '/welcome', to: 'home#welcome', as: 'welcome'
  get '/vehicles/entrada', to: 'vehicles#entrada', as: 'entrada'
  #Em 'to: 'vehicles#new' 'new' é o nome do método(def) dentro de vehicls_controller.rb
  #E 'vehicles' é o nome do controller.
  post '/vehicles', to: 'vehicles#create', as: 'vehicles'
  get '/saidas/new', to: 'saidas#saida', as: 'new_saida' #Chama o método 'saida'do controlador 'saidas'.
  post '/saidas/new', to: 'saidas#create', as: 'saida'
  get '/busca', to: 'vehicles#search', as: 'search_vehicle'
  get '/deletar', to: 'vehicles#procurar_deletar', as: 'delete_form'
  delete '/delete_vehicle/:placa', to: 'vehicles#destroy', as: 'destroy_vehicle'
  post '/search_vehicle', to: 'vehicles#procurar_deletar', as: 'procurar_deletar'
  patch '/edit_by_placa/:placa', to: 'vehicles#update', as: 'update_vehicle'
  get '/search_edit_vehicle', to: 'vehicles#search_edit_vehicle', as: 'search_edit_vehicle'
  get '/find_vehicle', to: 'vehicles#find_vehicle', as: 'find_vehicle'
  get '/vehicles/report', to: 'vehicles#report', as: 'report'
end