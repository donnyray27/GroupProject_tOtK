Rails.application.routes.draw do
  devise_for :users
  resources :releases, only: [:index, :show, :create, :new, :destroy] do
    resources :reviews, only: [:show, :create, :new, :destroy, :patch]
  end
  resources :users, only: [:show]

  root "releases#index"
end
