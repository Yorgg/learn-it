Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  get '/users/:id', to: 'users#show', as: 'user'
  root  'static_pages#home' 
  resources :tasks
end
