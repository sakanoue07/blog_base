Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :posts
  post 'users/add_score/:id', to: 'users#add_score'
  # match ':controller(/:action(/:id))', via: [ :get, :post, :patch ]
end
