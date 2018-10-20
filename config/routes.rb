Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'tickets#index'

  resources :tickets, only: [:index, :show, :new, :create]
  resources :comparison_sets, only: [:show]
end
