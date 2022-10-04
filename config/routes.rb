Rails.application.routes.draw do
  root 'users#index'
  get 'users/index'
  get 'user_posts/index'
  get '/users/:id', to: 'users#show'
  get '/user_posts/:id', to: 'user_posts#show'
  get '/users_id/posts', to: 'user_posts#index'
end
