PostitTemplate::Application.routes.draw do
  
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/show', to: 'posts#show'
  get '/show/:id', to: 'posts#index'

  resources 'posts', except: :destroy do
    member do
      post 'vote'
    end
  	resources 'comments', only: [:create, :vote] do
      member do
        post 'vote'
      end
    end
  end

  resources 'categories', only: [:new, :create, :show, :destroy]
  resources 'users', only: [:show, :create, :edit, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
