Rails.application.routes.draw do
  resources :users
  resources :posts
  get    'fish/index'  =>  'fish#index'
  get    'fish/:id'    =>  'fish#show'

  get    '/login'      => 'sessions#new'
  post   '/login'      => 'sessions#create'
  delete '/logout'     => 'sessions#destroy'
end
