Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'static/home'
  get 'profile/index'
  root to: 'static#home'
end
