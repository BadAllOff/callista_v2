Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :services
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
end
