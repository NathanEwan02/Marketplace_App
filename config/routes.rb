Rails.application.routes.draw do
  devise_for :users #controllers: { registrations: 'users/registrations'}
  resources :games
  resources :events
  root to: "events#index"
end
