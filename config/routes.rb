Rails.application.routes.draw do

  devise_for :users
  mount ActionCable.server => '/cable'

  root to: 'homes#show'

  resource :workshop
  resource :server, only: [:show]
  resources :rooms, only: [:index, :show, :create, :destroy]
  resources :messages, only: [:show, :create]
  resources :users, only: [:show]

  resource :simple_post, only: [:create]


end
