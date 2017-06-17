Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :reviews, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'restaurants#search'

  get 'results', to: 'restaurants#search_results'

  get 'about', to: 'static_pages#about', as: :about

  resources :restaurants

  get 'admin', to: 'users#index'

  get 'role_form', to: 'users#role_form'

  post 'set_role', to: 'users#set_role'

  match '/contacts', to: 'contacts#new', via: 'get'

  resources "contacts", only: [:new, :create]

end
