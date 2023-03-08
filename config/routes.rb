Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] 
  resources :genres do
    resources :likes, only: [:create, :destroy]
  end

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :points do
    resources :loves, only: [:create, :destroy]
  end

  resources :statics
  resources :others

  get 'statics/top' => 'statics#top'
  root 'statics#top'
end
