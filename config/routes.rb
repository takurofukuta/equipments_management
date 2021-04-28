Rails.application.routes.draw do
  root to: "equipments#index"
  resources :equipments, expect: :new
  get "/lendings", to: "lendings#index"
  post "/lendings/:id", to: "lendings#lending"
  patch "/lendings/:id", to: "lendings#return"
  get "/lendings/history", to: "lendings#lendings_history"

  devise_for :users
end
