Rails.application.routes.draw do
  get 'executive/index'
  get 'operations_staff/index'
  get 'analysts/index'
  get 'managers/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
end
