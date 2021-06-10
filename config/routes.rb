Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#splash'
  get '/home', to: 'pages#home'
  resources :payment_groups do
    get :join
    resources :splits, only: [:new, :create]
  end
  resources :splits, only: [:show, :edit, :update] do
    resources :bills, only: [:new, :create]
  end

  resources :bills, only: :update

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/scan', to: 'vision#scan'
    end
  end
end
