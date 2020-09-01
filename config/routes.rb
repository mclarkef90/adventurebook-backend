Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reviews
      resources :adventures
      resources :users
    end
  end
end
