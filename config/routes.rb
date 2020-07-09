Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :show ]
  resources :jobs, only: [ :index, :show ]
  resources :categories, only: [ :index ]
  resources :bookings
  resources :chatrooms, only: [:index] do
    resources :messages, only: [:index, :new, :create, :destroy]
  end
  resources :reviews, only: [ :create, :show, :destroy ]
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get '/user' => "pages#dashboard", :as => :user_root
end
