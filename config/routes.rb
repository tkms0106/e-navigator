Rails.application.routes.draw do
  get 'interviews/index'

  get 'interviews/new'

  get 'interviews/create'

  resources :users, only: [:index, :edit, :update]
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
