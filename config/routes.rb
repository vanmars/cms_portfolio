Rails.application.routes.draw do
  root to: "home#index"
  get 'home/index'
  get 'home/profile', to: 'home#profile', as: 'profile'

  devise_for :users

  resources :projects

  resources :posts do
    resources :comments
  end

  
  
end
