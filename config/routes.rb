Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # PWA files
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Authentication routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Dashboard
  get 'dashboard', to: 'dashboard#index'
  root 'dashboard#index'

  # Challenges CRUD
  resources :challenges do
    member do
      get :download_mxml
    end
  end

  # API routes (for potential future API usage)
  namespace :api do
    namespace :v1 do
      resources :challenges, only: [:index, :show, :create, :update, :destroy]
      get 'auth/user', to: 'auth#user'
    end
  end
end
