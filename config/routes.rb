Rails.application.routes.draw do
 
  # get 'books' => 'books#index'
  # get 'books/:id' => 'books#show', as: 'book'
  # get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  root 'homes#top'
  # post 'books' => 'books#create'
  # patch 'books/:id' => 'books#update', as: 'update_book'
  # delete '/books/:id' => 'books#destroy', as: 'destroy_book'
  resources :books
  
  end