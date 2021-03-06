Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :show ]
  resources :jobs, only: [ :index, :show ]
  resources :categories, only: [ :index ]
  resources :bookings do
    member do
      get :apply
    end
  end
  resources :chatrooms, only: [ :show ]
  resources :messages, only: [ :create, :show ]
  resources :reviews, only: [ :create, :show, :destroy ]
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get '/user' => "pages#dashboard", :as => :user_root
  get "/bookings/new" => "bookings#new", :as => :bookings_new

end
