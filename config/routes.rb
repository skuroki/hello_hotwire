Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "dashboard#index"

  post 'fortune', to: 'dashboard#fortune'

  resources :randoms, only: :index do
    collection do
      post :prepend
    end
  end
end
