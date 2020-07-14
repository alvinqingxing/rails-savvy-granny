Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  resources :users, only: [ :show ]
  resources :jobs, only: [ :index, :show ]
  resources :categories, only: [ :index ]
  resources :orders, only: [ :show, :create ] do
    resources :payments, only: :new
  end
  resources :bookings do
    member do
      get :apply
      get :cancel
    end
  end

  resources :chatrooms, only: [] do
    resources :messages, only: [:create, :destroy]
  end

  get "/bookings/:booking_id/chatroom", to: "chatrooms#show", as: :booking_chatroom

  resources :reviews, only: [ :new, :create, :show, :destroy ]
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get '/user' => "pages#dashboard", :as => :user_root
  get "/bookings/new" => "orderss#new", :as => :bookings_new
end
