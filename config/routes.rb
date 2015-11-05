Rails.application.routes.draw do
  root to: 'ratings#new'
  get "/auth/:provider/callback" => 'sessions#create'
  resources :sessions, only: :new
end
