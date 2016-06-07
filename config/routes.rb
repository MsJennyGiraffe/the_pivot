Rails.application.routes.draw do
  root to: 'home#index'

  resources :items, only: [:index]

  resources :categories, only: [:index]
  get '/:category_title', to: 'categories#show'



end
