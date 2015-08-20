Rails.application.routes.draw do
  get 'advertisements/index'

  get 'advertisements/show'

  resources :posts

  resources :advertisements

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  end
