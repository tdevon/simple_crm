Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  devise_scope :user do
    get 'login',    to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
  end
  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :contacts
end
