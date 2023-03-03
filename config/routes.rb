Rails.application.routes.draw do
  devise_for :users

  get 'statics/top' => 'statics#top'
  root 'statics#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

<<<<<<< HEAD
  resources :points do
    resources :loves, only: [:create, :destroy]
  end
=======
  
  resources :points do
    resources :loves, only: [:create, :destroy]
end
>>>>>>> 953b5ae2650980d2fadba71222f88ed416ac8860
  resources :statics
  resources :others

  resources :genres do
    resources :likes, only: [:create, :destroy]
  end
end
