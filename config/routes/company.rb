# frozen_string_literal: true

devise_for :companies, controllers: {
  registrations: "companies/registrations",
  sessions: "companies/sessions",
  passwords: "companies/passwords",
}

namespace :companies do
  devise_scope :company do
    get "sent_reset_password", to: "passwords#sent_reset_password"
    get "completion_reset_password", to: "passwords#completion_reset_password"
  end

  get "home", to: "home#index"
  resources :propositions, only: %i[index show new create] do
    collection do
      post :confirm
    end
  end
  resources :proposition_entries, only: %i[index] do
    member do
      get :entry_user
    end
  end
  resources :attendances, only: %i[index show] do
    resources :client_feed_backs, only: %i[new create] do
      member do
        get :complete
      end
    end
  end
  resources :users, only: %i[index show] do
    resources :scouts, only: %i[new create] do
      collection do
        get :complete
      end
    end
  end
  resource :account, only: %i[show]
  resource :usage_flow, only: %i[show]
  resource :contact, only: %i[show]
  resources :scouted_users, only: %i[index]
end
