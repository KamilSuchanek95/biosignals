Rails.application.routes.draw do

  root to: 'home#index'
  get 'home/index'
  get 'home/profile'
  delete 'home/destroy'

	resources :measurements

  devise_scope :user do 
    post 'users/edit' => 'users/registrations#edit'
  end

  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
