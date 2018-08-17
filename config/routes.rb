Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  resources :services
  resources :projects
  resources :countries do
    resources :realties
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
