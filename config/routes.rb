Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :show ]
  resources :jobs, only: [ :index, :show ]
  resources :categories, only: [ :index ]
  resources :bookings
  resources :chatrooms, only: [ :show ]
  resources :messages, only: [ :create, :show ]
  resources :reviews, only: [ :create, :show, :destroy ]
end
