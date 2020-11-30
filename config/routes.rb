Rails.application.routes.draw do
  get 'business/index'
  get 'process/index'
  get 'analysts/index'
  get 'production/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#home"
end
