Rails.application.routes.draw do
  devise_for :users
  get 'home/about', as: :about
  root :to => 'homes#top'
  resources :users do
  end
  resources :books do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments 
  end
end
