Rails.application.routes.draw do
  devise_for :producers
  devise_for :customers
  get 'items/index'
  root to: "items#index"
  resouces :tweets
end
