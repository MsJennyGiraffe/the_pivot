Rails.application.routes.draw do
  root to: 'home#index'

  resources :items, only: [:index, :show]

  resources :users, only: [:new, :create]

  resources :categories, only: [:index]

  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :cart, only: [:create]
  get "/cart", to: "cart#show"
  post "/cart", to: "cart#create"

  get '/search', to: 'search#index'

  get '/:category_title', to: 'categories#show'
end
