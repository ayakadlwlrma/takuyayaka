Rails.application.routes.draw do
  devise_for :users

  get 'statics/top' => 'statics#top'
  root 'statics#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :genres
  resources :points
  resources :statics
  resources :others
end
