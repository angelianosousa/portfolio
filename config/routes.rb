Rails.application.routes.draw do
  devise_for :users
  root to: 'site#index'
  resources :projects
  resources :stacks, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
