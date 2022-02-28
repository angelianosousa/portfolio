Rails.application.routes.draw do

  devise_for :users

  namespace :backoffice do 
    resources :projects, except: [:show]
    resources :stacks, except: [:show]
    resources :professional_carreers

  end

  get 'site/page_project/:id', to: "site#page_project", as: 'project'
  get 'site/projects', to: "site#projects", as: 'projects'
  get 'site/about_me', to: 'site#about_me', as: 'about_me'
  post 'site/send_contact', to: "site#sendmail", as: 'sendmail'
  
  root to: 'site#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
