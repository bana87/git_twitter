Rails.application.routes.draw do
  devise_for :users
  root :to => 'tweets#index'
  get  '/tweets' => 'tweets#index'
  get  '/tweets/new' => 'tweets#new'
  post  '/tweets' => 'tweets#create'
  delete '/tweets/:id' => 'tweets#destroy'
end
