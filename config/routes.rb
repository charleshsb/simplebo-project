Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tickets, only: [:index, :show, :update, :destroy] do
    resources :comments, only: [:create]
  end
end
