Rails.application.routes.draw do
  get '/home', to: 'hello#home'
  get '/contact', to: 'hello#contact'
  root 'hello#home'
  resources :tweets do
    resources :comments, only: [:create,:destroy]
    resources :likes, only: [:create, :destroy]
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :profiles, except: [:index, :destroy]
  get '/likes', to: 'likes#index'

  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
