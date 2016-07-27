Rails.application.routes.draw do

  devise_for :users
  mount ActionCable.server => '/cable'

  root to: 'homes#show'

  resource :workshop
  resource :server, only: [:show]
  resources :rooms, only: [:index, :show, :create]
  resources :messages, only: [:show, :create]
  resources :users, only: [:show]
  namespace :admin, module: :admins do
    resources :rooms, only: [:destroy]
  end

  resource :fake_post, only: [:create]


end
