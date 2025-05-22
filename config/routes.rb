Rails.application.routes.draw do
  devise_for :accounts

  # Root
  root "home#index"

  # Dashboard & Reports
  get "/dashboard", to: "dashboard#index"
  get "/reports", to: "reports#index"
  get "monthly_summary_data", to: "reports#monthly_summary_data"

  # Transactions and Categories
  resources :transactions
  resources :categories, only: [ :index, :new, :create, :edit, :update, :destroy ]

  # Settings
  get "settings", to: "settings#index"
  patch "settings/update_profile", to: "settings#update_profile"
  patch "settings/update_password", to: "settings#update_password"
  patch "settings/update_preferences", to: "settings#update_preferences"
  delete "settings/delete_account", to: "settings#destroy_account", as: :settings_destroy_account
end
