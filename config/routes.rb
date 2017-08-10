Rails.application.routes.draw do
  root to: 'tweets#index'

  get 'home/index'

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get 'sign_in', :to => 'tweets#index', :as => :new_session
  end

  get "/tweets/search" => 'tweets#index'
end
