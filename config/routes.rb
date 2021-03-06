Rails.application.routes.draw do
    root to: 'home#index'
    resource  :session
    namespace :user, path: ":user_slug", as: :user do
      resources :items, except: [:index]
    end
    resources :requests, only: [:update]
    resources :items, only: [:index, :show, :update]
    resources :users, only: [:new, :create, :edit, :show, :update]
    resources :categories, only: [:show], param: :name
    resources :sellers, only: [:index]
    resources :orders, only: [:index, :show, :create]
    resources :chat_rooms, only: [:new, :create, :show, :index]
    mount ActionCable.server => '/cable'

    namespace :admin do
      resources :items, only: [:new, :create]
      resources :platform_admin, only: [:index, :update]
    end

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get "/cart", to: "cart#show"
    post "/cart", to: "cart#create"
    delete "/cart", to: "cart#destroy"

    get '/search', to: 'search#index'
    get '/:user_slug', to: 'sellers#show', as: :seller

    get "*any", via: :all, to: "errors#not_found"
end
