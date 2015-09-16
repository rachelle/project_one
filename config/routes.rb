Rails.application.routes.draw do
  
  root 'static_pages#index'

    delete '/logout', to: 'sessions#destroy'

    get '/login', to: 'sessions#new'

    resources :sessions
    resources :users

    resources :photos do 
      resources :comments
    end
end
