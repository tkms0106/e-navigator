Rails.application.routes.draw do
  resources :users, only: [:index, :edit, :update] do
    resources :interviews, only: [:index, :new, :create]
  end
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
