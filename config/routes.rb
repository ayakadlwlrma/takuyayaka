Rails.application.routes.draw do
  get 'rooms/show'
  resources :posts
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  resources :genres do
    resources :likes, only: [:create, :destroy]
  end

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :points do
    resources :favorites, only: [:create, :destroy]
  end

  resources :tags do
    get 'points', to: 'points#search'
  end

  resources :others

  root 'points#index'
end
