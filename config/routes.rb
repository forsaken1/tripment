Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :procedures, only: [:index]
    end
  end

  root to: 'application#index'
end
