Rails.application.routes.draw do
  #
  root 'users#index'
  #
  resources :pictures
  resources :comments
  resources :users
  get '/login' => 'session#new', as: :login
  post '/login' => 'session#create'

  delete '/logout' => 'session#destroy', as: :logout


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
