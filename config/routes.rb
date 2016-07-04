Rails.application.routes.draw do

  root to: "users#splash"

  get "/", to: "users#splash", as: "splash"
  get "/users", to: "users#index", as: "users"
  get "/signup", to: "users#new", as: "new_user"

end
