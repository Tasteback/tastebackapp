Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'restaurants#search'

  get 'results', to: 'restaurants#search_results'

  get 'about', to: 'static_pages#about', as: :about

  resources :restaurants, only: [:show]

end
