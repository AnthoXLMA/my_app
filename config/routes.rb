Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get 'chat', to: 'chat#index'
  post 'chat', to: 'chat#create'

  # Defines the root path route ("/")
  root to: "pages#home"

  resources :users, only: [:index, :show, :update, :edit, :delete] do
    resources :dances, only: [:index, :update, :edit] do
    post 'select', on: :member  # This adds a route for selecting a dance
  end
end

  resources :events
end
