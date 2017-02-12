Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'sessions'
  }

  devise_scope :user do
    get :signup, to: 'users/registrations#new'
    get :activate, to: 'users/confirmations#show'
  end

  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'static_pages#index'


  namespace :api, defaults: { format: :json } do
    resources :posts, only: [] do
      collection do
        get :index
      end
      member do
        get :show
      end
    end

  end
end
