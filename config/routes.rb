Rails.application.routes.draw do
  get 'bookings/create'

  root to: 'pages#home'
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resource :profile, only: [:show]
  resources :offers do
    resources :bookings, only: [:create]
    resources :reviews, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
