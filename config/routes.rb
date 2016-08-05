Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  mount ActionCable.server => '/cable'

  root to: 'homes#show'

  resource :workshop
  resource :server, only: [:show]
  resources :rooms, only: [:index, :show, :create]
  resources :messages, only: [:show, :create]
  resources :users, only: [:show]
  resource :client
  resource :fake_post, only: [:create]

end
