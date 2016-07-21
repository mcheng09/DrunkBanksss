Rails.application.routes.draw do

  root to: "users#splash"
  get "/", to: "users#splash", as: "splash"

  # User Routes
  get "/users/:id", to: "users#show", as: "user"
  get "/users", to: "users#index", as: "users"
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
  resources :bets do
    get "/volunteers/:id", to: "volunteers#show", as: "volunteer"
    get "/volunteers", to: "volunteers#index", as: "volunteers"
    post "/volunteers", to: "volunteers#create"

    delete "/volunteers/:id", to: "volunteers#delete"
  end

  # Volunteer Update Route for Completion
  patch "/volunteers/:id", to: "volunteers#done", as: "edit_volunteer"

  # Stripe Routes
  resources :charge

end
