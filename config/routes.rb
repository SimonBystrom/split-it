Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :payment_groups, only: [:index, :show, :new, :edit, :update] do
    resources :splits, only: [:new]
  end
  resources :splits, only: [:show, :edit] do
    resources :bills, only: [:new]
  end

  resources :bills, only: :edit
end
