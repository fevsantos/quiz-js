Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root to: 'pages#home'
  get 'search', to: 'questionnaires#search'
  get 'test', to: 'pages#test'
  resources :questionnaires
end
