Rails.application.routes.draw do
  root to: 'home#index'


  resources :items, only: [:index, :show]
  resources :users, only: [:new, :create, :edit, :show, :update]
  resources :categories, only: [:index]
  resources :sellers, only: [:index, :show]
  resources :orders, only: [:index, :show, :create] do
    resources :reservations, only: [:new, :create]
  end

  namespace :admin do
    get '/dashboard', to: 'orders#index'
    resources :orders, only: [:index, :show, :update]
    resources :items, only: [:new, :create]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get "/cart", to: "cart#show"
  post "/cart", to: "cart#create"
  patch "/cart", to: "cart#update"
  delete "/cart", to: "cart#destroy"

  get '/search', to: 'search#index'

  get '/:category_title', to: 'categories#show'
end
