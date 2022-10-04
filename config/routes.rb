Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: %i[show index] do
    resources :user_posts, only: %i[show index]
  end
end
