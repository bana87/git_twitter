Rails.application.routes.draw do
  devise_for :users
  root :to => 'tweets#index'
  get     '/tweets'       => 'tweets#index'
  post    '/tweets'       => 'tweets#create'
  delete  '/tweets/:id'   => 'tweets#destroy'
  get     'users/:id'     => 'users#show'
  get     'users/:id/edit'=> 'users#update'
end
