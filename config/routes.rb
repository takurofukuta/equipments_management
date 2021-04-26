Rails.application.routes.draw do
  get 'equipments/index'
  get 'equipments/edit'
  get 'equipments/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
