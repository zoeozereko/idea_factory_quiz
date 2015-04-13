Rails.application.routes.draw do
  devise_for :users

  root to: "ideas#index"

  resources :ideas do
    resources :comments
    resources :joins, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :joins, only: [:index]
  
end
