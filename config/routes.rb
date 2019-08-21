PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  get '/show', to: 'posts#show'
  get '/show/:id', to: 'posts#index'
  resources 'posts'
end
