Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tickets, only: [:create, :index, :show, :destroy]
end
