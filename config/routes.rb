Rails.application.routes.draw do
  get 'bookings/create'

  root to: 'pages#home'
  devise_for :users
  resource :profile, only: [:show]
  resources :offers, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
