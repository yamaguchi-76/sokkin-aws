# frozen_string_literal: true

devise_for :admins, controllers: {
  registrations: "admins/registrations",
  sessions: "admins/sessions"
}

namespace :admins do
  get "home", to: "home#index"
  resources :companies
  resources :propositions
  resources :users, only: %i[index show destroy] do
    collection do
      get :export_csv
    end
  end
  resources :attendances, only: %i[index show edit update] do
    resources :monthly_unit_prices, only: %i[new create]
  end
  resources :proposition_entries, only: %i[index] do
    member do
      patch :update_status
    end
  end
  resources :scouts, only: %i[index new create]
end
