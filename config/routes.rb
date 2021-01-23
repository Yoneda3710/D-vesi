Rails.application.routes.draw do
  get 'cards/new'
  devise_for :producers
  devise_for :customers
  get 'items/index'
  root to: "items#index"
  resources :items do
    member do
      post :order
    end
    resources :orders, only: [:index, :create]
  end
  resources :producers
  resources :customers
  resources :cards, only: [:new, :create]
end
