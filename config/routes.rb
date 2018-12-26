Rails.application.routes.draw do

  root 'welcome#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/home', to: 'home#show'
  get '/logout', to: 'sessions#destroy'

  post "/parking" => "parkings#create", :as => :parking

end
