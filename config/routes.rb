Rails.application.routes.draw do
  get 'rooms/show'
  get 'points/calender' => 'points#calender'

  resources :points do
    resources :favorites, only: [:create, :destroy]
  end
  
  devise_for :users
  resources :users, :only => [:index, :show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show]

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  resources :tags do
    get 'points', to: 'points#search'
  end

  root 'points#index'
end
