Rails.application.routes.draw do
  devise_for :users
  get 'home/about', as: :about
  get 'homes/top'
  root :to => 'homes#top'
  resources :users do
  end
  
  resources :books do
  end
end
