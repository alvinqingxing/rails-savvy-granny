Rails.application.routes.draw do
  get 'reviews/create'
  get 'reviews/show'
  get 'reviews/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
