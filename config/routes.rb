Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  get 'static/home'
  root to: 'static#home'
end
