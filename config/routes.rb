Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :payment_groups, only: [:index, :show, :new, :edit, :update, :create] do
    resources :splits, only: [:new, :create]
  end
  resources :splits, only: [:show, :edit] do
    resources :bills, only: [:new, :create]
  end

  resources :bills, only: :update

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/scan', to: 'vision#scan'
    end
  end
end
