Rails.application.routes.draw do
  resources :categories
  resources :posts
  devise_for :users, controllers: { registrations: 'registrations' },  path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
