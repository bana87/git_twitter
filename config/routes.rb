Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root :to  => 'tweets#index'
  get     '/tweets', to: 'tweets#index'
  post    '/tweets', to: 'tweets#create'
  delete  '/tweets/:id', to: 'tweets#destroy'
  get     'users/:id', to: 'users#show'
  post "favorites/:tweet_id/create", to: "favorites#create", constraints: {tweet_id: /\d+/}, as: :favorites_create
  post "favorites/:tweet_id/delete", to: "favorites#delete", constraints: {tweet_id: /\d+/}, as: :favorites_delete
end
