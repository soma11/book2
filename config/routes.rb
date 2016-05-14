Rails.application.routes.draw do
  resources :purchase_requests
  resources :receipt_images, only: [:show]
  devise_for :users
  resources :users
  namespace :admin do
    resources :receipts
    namespace :m do
      resources :books
    end
  end
end
