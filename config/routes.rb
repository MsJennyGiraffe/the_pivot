Rails.application.routes.draw do
  root to: 'home#index'

  resources :items, only: [:index, :show]

  resources :users, only: [:new]

  resources :categories, only: [:index]

  get '/dashboard/:id', to: 'users#show'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  get '/search', to: 'search#index'

  get '/:category_title', to: 'categories#show'
end
