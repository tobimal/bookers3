Rails.application.routes.draw do
   get "/top"=> "home#top"
  root 'home#top'
  get 'home/about' => 'home#about'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end


end