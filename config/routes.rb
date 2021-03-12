Rails.application.routes.draw do

  resources :measurements
  root to: 'home#index'
  get 'home/index'
  get 'home/profile'

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
