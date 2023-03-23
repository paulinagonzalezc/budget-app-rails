Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_scope :user do
    authenticated :user do
      root 'splash#index', as: :authenticated_root
    end
    
    unauthenticated do
      root 'splash#index', as: :unauthenticated_root
    end
  end  

  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    resources :expenses, only: [:index, :new, :create, :show, :destroy]
  end
end
