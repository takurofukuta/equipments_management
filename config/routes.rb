Rails.application.routes.draw do
  root to: "equipments#index"
  resources :equipments, expect: :new
  get "/lendings", to: "lendings#index"
  post "/lendings/:id", to: "lendings#lending"
  patch "/lendings/:id", to: "lendings#return"
  get "/lendings/history", to: "lendings#lendings_history"
  get "operation_history/", to: "operation_histories#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                     }
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
