Rails.application.routes.draw do
  resources :users, only: [:index, :edit, :update] do
    resources :interviews, only: [:index, :new, :create]
  end
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: redirect('/users/'), as: :authenticated_root
    end
    unauthenticated do
      root to: redirect('/users/sign_in'), as: :unauthenticated_root
    end
  end
end
