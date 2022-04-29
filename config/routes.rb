Rails.application.routes.draw do
  get 'spending/new'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "home#index"
  resource :spendings
end
