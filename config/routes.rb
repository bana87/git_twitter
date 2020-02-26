Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  root :to => 'tweets#index'
  get     '/tweets'       => 'tweets#index'
  post    '/tweets'       => 'tweets#create'
  delete  '/tweets/:id'   => 'tweets#destroy'
  get     'users/:id'     => 'users#show'
end
