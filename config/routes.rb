Rails.application.routes.draw do

  resources :measurements
  root to: 'home#index'
  resources :home
  Rails.application.routes.draw do
  resources :measurements
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
