Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"

  post 'fortune', to: 'dashboard#fortune'

  resources :randoms, only: [:index, :update, :destroy] do
    collection do
      post :prepend
      post :append
    end
    member do
      post :replace
      post :add_before
      post :add_after
    end
  end
end
