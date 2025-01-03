Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :contacts, path: '', path_names: {
    sign_in: 'sign_in', sign_out: 'sign_out'
  }, controllers: { sessions: 'contacts/sessions' }

  devise_for :admins, path: 'admins', path_names: {
    sign_in: 'sign_in', sign_out: 'sign_out'
  }, controllers: { sessions: 'admins/sessions' }

  root 'dashboard#index'

  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
  end
  get 'dashboard', to: 'dashboard#index'
end
  