PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/show', to: 'posts#show'
  get '/show/:id', to: 'posts#index'
  resources 'posts', except: :destroy do
  	resources 'comments', only: :create
  end
  resources 'categories', only: [:new, :create, :show]
  resources 'users', only: [:show, :create, :edit, :udpate]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
