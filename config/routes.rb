Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :courses do
    resources :reviews, only: %i[new create]
    resources :reservations, only: [ :new, :create ]
    collection do
      get :arts, :cuisine, :artisanat, :sport, :musique, :langues
    end
  end
  resources :reservations, only: %i[destroy edit update]
  resources :reviews, only: %i[destroy edit update]
end
