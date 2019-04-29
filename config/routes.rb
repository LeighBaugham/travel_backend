Rails.application.routes.draw do
  resources :trips
  resources :passports
  resources :users

  post "/login", to: "users#login"
  # get "/signup", to: "users#create"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
