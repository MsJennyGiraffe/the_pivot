Rails.application.routes.draw do
  root to: 'home#index'

  resources :items, only: [:index, :show]

  resources :categories, only: [:index]

  resources :cart, only: [:create]
  get "/cart", to: "cart#show"
  post "/cart", to: "cart#create"

  get '/search', to: 'search#index'

  get '/:category_title', to: 'categories#show'
end
