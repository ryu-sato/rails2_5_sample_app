# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'tickets#index'

  resources :tickets, only: [:index, :show, :new, :create]
  resources :normal_log_raws, only: [:index, :new, :create, :destroy]
  resources :anomaly_log_raws, only: [:index, :new, :create, :destroy]

  resources :comparison_sets, only: [:show]
end
