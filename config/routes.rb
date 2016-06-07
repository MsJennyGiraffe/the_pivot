Rails.application.routes.draw do
  resources :items, only: [:index]

  resources :categories, only: [:index]
  get '/:category_title', to: 'categories#show'

  root to: 'categories#index'

end
