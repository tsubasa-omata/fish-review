Rails.application.routes.draw do
  resources :users
  resources :posts
  get   'fish/index'  =>  'fish#index'
  get   'fish/:id'    =>  'fish#show'
end
