Rails.application.routes.draw do
  root to: 'tweets#index'

  get "/tweets/search" => 'tweets#index'
end
