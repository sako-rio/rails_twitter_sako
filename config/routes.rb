Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get "tweets", to: "tweets#index", as: "user_root"

  get "/tweets/search" => 'tweets#index'
end
