Rails.application.routes.draw do
  devise_for :users
  get 'home/about', as: :about
  root :to => 'homes#top'
  resources :users do
  end
  resources :books do
   resources :book_comments 
  end
end
