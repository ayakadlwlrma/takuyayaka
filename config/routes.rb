Rails.application.routes.draw do
  devise_for :users

  get 'statics/top' => 'statics#top'
  root 'statics#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

<<<<<<< HEAD

  resources :points
=======
  resources :genres
  resources :points do
    resources :loves, only: [:create, :destroy]
end
>>>>>>> b707825a0f87c69708ff4d1d746492badb4194ac
  resources :statics
  resources :others

  resources :genres do
    resources :likes, only: [:create, :destroy]
  end
end
