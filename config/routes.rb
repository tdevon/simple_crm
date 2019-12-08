Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"
  get "dashboard", to: "pages#dashboard", as: :dashboard
  
  devise_scope :user do
    get 'login',    to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
  end

  resources :contacts

  resources :sales
  get "sales/:id/contact", to: "sales#add_contact", as: :add_contact
  post "sales/:id/contact", to: "sales#update"
end
