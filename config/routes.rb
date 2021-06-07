Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :payment_groups do
    member do
      post :add_member
    end
    resources :splits, only: [:new, :create]
  end
  resources :splits, only: [:show, :edit] do
    resources :bills, only: [:new, :create]
  end

  resources :bills, only: :update
end
