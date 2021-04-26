Rails.application.routes.draw do
  root to: "equipments#index"
  resources :equipments, expect: :new
  devise_for :users
end
