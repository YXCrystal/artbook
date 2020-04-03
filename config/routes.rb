Rails.application.routes.draw do

  devise_for :users

  resources :profile, controller: "users", as: "users" do 
    member do 
      get "edit_header"
      get "edit_info"
      get "photos"
      get "about"
      get "friends"
    end

    resources :posts, only: [:new, :create, :show]
      
  end
  
  resources :posts, only: [:show, :edit, :update, :delete] do 
    put "like", on: :member
    resources :comments, only: [:new, :create]
  end

  get '/search', to: "posts#search"

  resources :friendships, only: [:show, :create, :destroy]
  
  authenticated :user do 
    root "users#index", as: "authenticated_root"

  end

  root "homepage#welcome"

end
