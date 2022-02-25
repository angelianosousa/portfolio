Rails.application.routes.draw do

  devise_for :users
  namespace :backoffice do 
    get 'welcome/index'
    resources :projects
    resources :stacks, except: [:show]
    delete 'stacks/destroy_picture/:id', to: "stacks#delete_picture"
  end
  root to: 'site#index'

  get 'site/page_project/:id', to: "site#page_project", as: 'project'
  get 'site/projects', to: "site#projects", as: 'projects'
  get 'site/about_me', to: 'site#about_me', as: 'about_me'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
