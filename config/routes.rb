# config/routes.rb

Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  
  resources :users
  resources :rooms do
    resources :messages, only: [:index, :create]
  end

  # 追加
  get '/messages', to: 'messages#index'
end
