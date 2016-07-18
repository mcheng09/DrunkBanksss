Rails.application.routes.draw do

  root to: "users#splash"
  get "/", to: "users#splash", as: "splash"

  # User Routes
  get "/users/:id", to: "users#show", as: "user"
  get "/signup", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#delete"

  # Session Routes
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#delete"

  # Bets Routes
  get "/bets/:id", to: "bets#show", as: "bet"
  get "/bets", to: "bets#index", as: "bets"
  get "/bets/new", to: "bets#new", as: "new_bet"
  post "/bets", to: "bets#create"
  get "/bets/:id/edit", to: "bets#edit", as: "edit_bet"
  patch "/bets/:id", to: "bets#update"

end
