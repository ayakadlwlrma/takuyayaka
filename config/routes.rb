Rails.application.routes.draw do
  resources :posts
  devise_for :users
  resources :users, only: [:show] 
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

  resources :statics
  resources :others

  get 'statics/top' => 'statics#top'
  root 'statics#top'
end
