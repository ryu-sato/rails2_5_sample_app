# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'tickets#index'

  resources :tickets, only: [:index, :show, :new, :create]

  resources :raw_logs, only: [:index, :new, :create, :destroy]

  resources :diff_sets, only: [:show]
  resources :diff_units, only: [:show]

  resources :command_logs, only: [:show]
end
