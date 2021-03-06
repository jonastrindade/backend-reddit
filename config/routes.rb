Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'api/v1/status#index'

  namespace :api do
    namespace :v1 do
      resources :comments
      resources :posts
      resources :status, only: [:index]
      resources :threads
    end
  end
end
