Rails.application.routes.draw do
  root 'groups#index'

  devise_for :users

  resources :groups do
    resources :posts, only: [:create]
    resources :members, only: [:create, :destroy]
  end
end
