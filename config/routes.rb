Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root :to  => 'tweets#index'
  get     '/tweets', to: 'tweets#index'
  post    '/tweets', to: 'tweets#create'
  delete  '/tweets/:id', to: 'tweets#destroy'
  get     'users/:id', to: 'users#show'
  post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'
end
