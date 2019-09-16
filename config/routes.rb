Rails.application.routes.draw do
  get 'users/index'
  resources :users
  resources :posts
  get   'fish/index'  =>  'fish#index'
  get   'fish/:id'    =>  'fish#show'
end
