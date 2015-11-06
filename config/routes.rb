Rails.application.routes.draw do
  root to: 'ratings#new'
  get "/auth/:provider/callback" => 'sessions#create'
  resources :invites, only: :show
  resources :ratings, only: :create
  resources :sessions, only: :new
  resources :signups, only: :create
end
