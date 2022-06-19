Rails.application.routes.draw do
  get 'pages/home'
  get 'base_pages/home'
  devise_for :users
  root 'base_pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show] # Devise takes care of others
end
