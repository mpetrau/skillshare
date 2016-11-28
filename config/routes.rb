Rails.application.routes.draw do
  get 'bookings/create'

  root to: 'pages#home'
  devise_for :users
  resources :offers, only: [:index, :show] do
    resources :bookings, only: [:index]
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
