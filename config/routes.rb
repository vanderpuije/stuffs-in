Rails.application.routes.draw do
  resources :categories, except: [:destroy]

  devise_for :sellers

  root 'welcome#home'

  resources :products

  resources :sellers


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
