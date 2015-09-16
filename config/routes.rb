Rails.application.routes.draw do
  

  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/show'

  get 'reviews/edit'

  get 'reviews/update'

  get 'reviews/destroy'

  get 'photos/index'

  get 'photos/new'

  get 'photos/show'

  get 'photos/edit'

  get 'photos/update'

  get 'photos/destroy'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  get 'users/index'

  get 'users/new'

  get 'users/edt'

  get 'users/update'

  get 'users/show'

  get 'users/destroy'

   root 'sessions#index'

end
