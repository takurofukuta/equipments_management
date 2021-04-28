Rails.application.routes.draw do
  root to: "equipments#index"
  resources :equipments, expect: :new
  get "/lendings", to: "lendings#index"
  get "/lendings/history", to: "lendings#lendings_history"
  post "/lendings/:id", to: "lendings#lending"
  patch "/lendings/:id", to: "lendings#return"

  devise_for :users
end
