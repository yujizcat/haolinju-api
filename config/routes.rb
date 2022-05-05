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
      resources :bids, only: [:create, :show, :destroy] do
        resources :reviews, only: [:index] # bids/:bid_id/reviews
      end

      resources :users, only: [:index, :show] do
        resources :items, only: [:index, :show]
      end

      get "users/:id/user_items", to: "items#user_items"
      get "users/:id/items", to: "items#myitems"
      patch "bids/:id/decline", to: "bids#decline"
      patch "bids/:id/accept", to: "bids#accept"
      patch "items/:id/receive", to: "items#receive"
      patch "items/:id", to: "items#update"
    end
  end
end
