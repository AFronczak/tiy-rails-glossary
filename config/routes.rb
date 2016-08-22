Rails.application.routes.draw do
  root 'homepage#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  resource :session, only: [:new, :create, :destroy]
  resources :categories
  resources :terms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
