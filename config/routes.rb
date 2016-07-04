Rails.application.routes.draw do

  root to: "users#splash"

  get "/", to: "users#splash", as: "splash"
  get "/users", to: "users#index", as: "users"
  get "/users/:id", to: "users#show", as: "user"
  get "/signup", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"

end
