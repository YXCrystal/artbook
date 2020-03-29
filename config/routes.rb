Rails.application.routes.draw do

  devise_for :users
  resources :profile, controller: "users", as: "users" do 
    member do 
      get "edit_header"
    end

    resources :posts, only: [:new, :create, :show] 
      
  end

  resources :posts, only: [:show] do 
    put "like", on: :member
    resources :comments, only: [:new, :create]
  end
  
  authenticated :user do 
    root "users#index", as: "authenticated_root"

  end

  root "homepage#welcome"

end
