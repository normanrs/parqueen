Rails.application.routes.draw do

  root 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/home', to: 'home#show'
  get '/logout', to: 'sessions#destroy'

  post '/notifications/:id', to: 'users#update', as: 'notifications'
  get '/notifications/:id', to: 'users#update'
  post '/text', to: 'texts#create'

  resources :users, only: [:update, :create]

  get '/parking', to: 'parking#create_parking'
  post '/parking', to: 'parking#create_parking'


end
