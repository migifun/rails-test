Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "receptions#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy"

  resources :receptions, only: [ :index, :create, :destroy ], path: "reception" do
    member do
      get :calling
    end
  end
end
