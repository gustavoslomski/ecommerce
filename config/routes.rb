Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  namespace :admin do
    root to: "home#index"
    resources :categories
    resources :products
  end
end
