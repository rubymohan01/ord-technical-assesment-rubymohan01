Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :contacts, path: '', path_names: {
    sign_in: 'sign_in', sign_out: 'sign_out'
  }

  devise_for :admins, path_names: {
    sign_in: 'sign_in', sign_out: 'sign_out'
  }, controllers: { sessions: 'admins/sessions' }

  root 'dashboard#index'

  namespace :admins do
    get 'dashboard', to: 'dashboard#index'
  end
  get 'dashboard', to: 'dashboard#index'
  
  resources :companies
  resources :agencies
  resources :employees
  resources :agents
  resources :csv_imports
end
  