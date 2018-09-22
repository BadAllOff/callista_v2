# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    devise_for :users
    mount Ckeditor::Engine => '/ckeditor'

    resources :services
    resources :projects
    resources :countries do
      resources :realties
    end

    match '/contacts', to: 'contacts#new', via: 'get'
    resources 'contacts', only: %i[new create]
    root 'welcome#index'
  end
end
