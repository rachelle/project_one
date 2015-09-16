Rails.application.routes.draw do
  

  get 'users/index'

  get 'users/new'

  get 'users/edt'

  get 'users/update'

  get 'users/show'

  get 'users/destroy'

   root 'sessions#index'

end
