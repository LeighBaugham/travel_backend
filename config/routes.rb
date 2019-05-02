Rails.application.routes.draw do
  resources :trips
  resources :passports
  resources :users

  post '/login', to: 'login#login', as: 'login'
  get '/profile', to: 'users#profile'

  get "/mytrips", to: "trips#mytrips"
  get "/mypassports", to: "passports#mypassports"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
