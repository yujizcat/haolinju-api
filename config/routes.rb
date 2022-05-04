Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "login", to: "sessions#login", as: :login

      resources :items, only: [:index, :create, :show, :update, :destroy]
      resources :bids, only: [:index, :create, :show, :destroy] do
        resources :reviews, only: [:index]
      end

      get "users/:id/items", to: "items#myitems"
      patch "bids/:id/decline", to: "bids#decline"
      patch "bids/:id/accept", to: "bids#accept"
      patch "items/:id/receive", to: "items#receive"
      patch "items/:id", to: "items#update"
    end
  end
end
