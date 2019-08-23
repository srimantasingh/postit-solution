PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  get '/show', to: 'posts#show'
  get '/show/:id', to: 'posts#index'
  resources 'posts', except: :destroy
  resources 'categories', only: [:new, :show, :update]
end
