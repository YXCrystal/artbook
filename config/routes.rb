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

  match '/artist/:id', to: "users#show", as: "artist", via: "get"

  resources :posts, only: [:show] do 
    put "like", on: :member
    resources :comments, only: [:new, :create]
  end
  
  authenticated :user do 
    root "users#index", as: "authenticated_root"

  end

  root "homepage#welcome"

end
