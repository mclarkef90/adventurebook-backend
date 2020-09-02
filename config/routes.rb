Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reviews
      resources :adventures
      resources :users
      post '/login', to: 'users#login'
      get '/top_user', to: 'users#topUser'
      get '/top_adventure', to: 'adventures#topAdventure'

    end
  end
end
