Rails.application.routes.draw do
  get 'posts/index'
  # get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[new create]
      resources :likes, only: [:create]
    end
  end

  get '/users/:id', to: 'users#show'
  get '/posts/new', to: 'posts#new'
  get '/posts/:id', to: 'posts#show'
end
