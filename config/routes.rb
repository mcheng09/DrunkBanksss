Rails.application.routes.draw do

  root to: "users#splash"

  get "/", to: "users#splash", as: "splash"
  get "/users", to: "users#index", as: "users"
  get "/signup", to: "users#new", as: "new_user"
  post "/users", to: "users#create"

end
