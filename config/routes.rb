Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i[show index] do
    resources :posts, only: %i[show index]
  end
  get "/users/:id", to: "users#show"
  get "/posts/:id", to: "posts#show"
    
end
