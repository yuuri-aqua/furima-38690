Rails.application.routes.draw do
  root to: 'items#index'
  resources :questions, only: [:index]
end
