Rails.application.routes.draw do
  resources :notifications
  resources :products do
    resources :borrowing_histories
  end
  resources :recommends
  resources :purchase_requests
  resources :receipt_images, only: [:show]
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"},
    controllers: { omniauth_callbacks: "omniauth_callbacks" }
  resources :users
  namespace :admin do
    resources :receipts
    namespace :m do
      resources :books
      resources :branches
    end
  end
  resource :dashboard, only: [:show]
  root to: "dashboards#show"
  resources :books, only: :index
end
