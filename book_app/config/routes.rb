Rails.application.routes.draw do
  # get 'book/new'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html]
  # post 'book' => 'book#create'
   get 'top' => 'homes#top'
  # get 'book' => 'book#index'
  # get 'book' => 'book#show'
  root :to => 'homes#top' 
   resources :books

 delete 'books/:id' => 'books#destroy', as: 'destroy_book'

end
