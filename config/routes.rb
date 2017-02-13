Rails.application.routes.draw do
  root 'home#index'

  namespace :master do
    get '/dashboard', to: 'dashboard#index'
    resources :organizers, except: :edit
    resources :schools, only: [:index, :create, :new, :show]
    resources :members, only: [:index, :show ] do
      resources :managements, only: :destroy
    end
    resources :notices
  end

  namespace :organizer do
    get '/dashboard', to: 'dashboard#index'
    resources :members do
      resources :managements, only: [:new, :edit, :update, :delete]
    end
    resources :notices, only: [:index, :show]
  end

  devise_for :users, controllers: {
      registrations: 'user/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
