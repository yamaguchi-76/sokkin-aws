# frozen_string_literal: true

devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: "users/sessions",
  passwords: "users/passwords"
}

namespace :users do
  devise_scope :user do
    get "completion", to: "registrations#completion"
    get "sent_reset_password", to: "passwords#sent_reset_password"
    get "completion_reset_password", to: "passwords#completion_reset_password"
  end

  get "home", to: "home#index"
  resources :attendances do
    resources :operating_times
    patch "update_operating_times", to: "operating_times#update_operating_times"
    patch "hand_in_operating_times", to: "operating_times#hand_in_operating_times"
    resources :feed_backs do
      member do
        get :complete
      end
    end
  end
  resource :basic_infos, only: %i[show edit update]
  resource :educational_backgrounds, only: %i[show edit update]
  resource :employment_statuses, only: %i[show edit update]
  get "double_job_experiences", to: "double_job_experiences#show"
  get "double_job_experiences/edit", to: "double_job_experiences#bulk_edit"
  patch "double_job_experiences", to: "double_job_experiences#bulk_update"
  resource :self_introductions, only: %i[show edit update]
  resources :propositions, only: %i[index show] do
    resources :favorites, only: %i[create destroy], controller: "proposition_favorites"
    member do
      get :entry_form
      post :entry
      get :complete
    end
  end
  resources :proposition_entries, only: %i[index]
  resources :skills do
    collection do
      get "complete"
      get "skill_diagnose"
      post "skill_diagnose_create"
      patch "skill_diagnose_update"
    end
    member do
      get "skill_diagnose_edit"
    end
  end
  resource :account, only: %i[show]
  resource :bank_account, only: %i[edit update]
  resource :usage_flow, only: %i[show]
  resource :contact, only: %i[show]
  resources :scouts, only: [] do
    member do
      patch :not_interested
    end
  end
  resource :need_initial_setting, only: %i[show]
end
