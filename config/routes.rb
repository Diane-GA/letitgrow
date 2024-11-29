Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # root doit diriger vers homepage
  root to: "pages#home"

  # création des routes culture (new/create/show/index/destroy)
  resources :cultures, only: %i[new create show index destroy] do
    # task (new/create) doit être nested dans culture
    resources :tasks, only: %i[new create]
  end

  # task (show/index/destroy/validate/description)
  resources :tasks, only: %i[show index destroy edit update] do
    # routes validates et description dépendent d'une task
    member do
      patch :validate
      get :description
    end
    collection do
      get :index_date
    end
  end

  # page profile ne dépend pas d'un modèle donc pas resources
  get "/profile", to: "profiles#show", as: :profile
end
