Rails.application.routes.draw do

  root 'front_end#index'

  get 'admin' => 'admin/users#index'
  namespace :admin do
    resources :books, path: 'books'
    resources :categories, path: 'categories'
    resources :tags, path: 'tags'
    resources :posts, path: 'posts'
    resources :users, path: 'users', only: [:index, :create, :show, :edit, :update, :destroy]
  end

  get '/sign-up' => 'admin/users#new'
  get '/sign-in' => 'sessions#view_sign_in'
  post '/sign-in' => 'sessions#create'
  get '/sign-out' => 'sessions#destroy'
  
  # get 'post/:slug' => 'front_end#show_item', as: 'post'
  get 'category/:slug' => 'front_end#category', as: 'category'
  get 'tag/:slug' => 'front_end#tag', as: 'tag'
  get 'books/:slug' => 'front_end#show_book', as: 'book'
  get 'books' => 'front_end#all_book', as: 'books'

  get 'profile' => 'user#show_user', as: 'profile_user'
  post 'profile/update' => 'user#update_user', as: 'profile_user_update'

  resources :comments, only: [:create, :destroy]
end
