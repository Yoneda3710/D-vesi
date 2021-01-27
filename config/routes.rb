Rails.application.routes.draw do
  get 'cards/new'
  devise_for :producers
  devise_for :customers,controllers: {
    registrations: 'customers/registrations'
  }
  devise_scope :customer do
    get 'addresses', to: 'customers/registrations#new_address'
    post 'addresses', to: 'customers/registrations#create_address'
  end
  
  get 'items/index'
  root to: "items#index"
  resources :items do
    post 'order', on: :member
  end
  resources :orders
  resources :customers
  resources :producers
  resources :cards, only: [:new, :create]
end
