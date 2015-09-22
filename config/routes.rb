Rails.application.routes.draw do
  
  root 'static_pages#index'

    delete '/logout', to: 'sessions#destroy'

    get '/login', to: 'sessions#new'

    resources :sessions
    resources :users
    resources :ratings, only: :update

    resources :photos do 
      resources :reviews
    end
end
