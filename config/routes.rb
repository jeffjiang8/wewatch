Rails.application.routes.draw do
  resources :watches
  resources :comments
  resources :achievements
  resources :user_achievements
  resources :users
  get '/signup', to: 'users#new', as: 'signup'
  resources :views
  resources :shows
  resources :seasons, only: [:show]
  resources :episodes
  resources :followings


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/search' => 'shows#search_shows'
  root 'shows#index'
  # delete 'sessions', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
