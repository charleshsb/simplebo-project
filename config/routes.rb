Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tickets, only: [:create, :index, :show, :update, :destroy] do
    resources :comments, only: [:create]
  end
end
