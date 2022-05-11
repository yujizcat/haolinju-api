Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "login", to: "sessions#login", as: :login

      get "items/freebie", to: "items#freebie"
      get "items/search", to: "items#search"
      resources :items, only: [:index, :create, :show, :update, :destroy] do
        resources :bids, only: [:index] # items/:item_id/bids
      end
      resources :bids, only: [:index, :create, :show, :destroy] do
        resources :reviews, only: [:index] # bids/:bid_id/reviews
      end

      resources :users, only: [:index, :show] do
        resources :items, only: [:index, :show]
        resources :bids, only: [:index, :create]
      end

      get "users/:id/user_items", to: "items#user_items"
      get "users/:id/items", to: "items#myitems"
      post "bids/:id/decline", to: "bids#decline"
      post "bids/:id/accept", to: "bids#accept"
      post "bids/:id/pending", to: "bids#pending"
      post "items/:id/receive", to: "items#receive"
      post "items/:id/notreceive", to: "items#notreceive"
      patch "items/:id", to: "items#update"
    end
  end
end
