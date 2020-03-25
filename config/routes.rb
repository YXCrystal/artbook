Rails.application.routes.draw do

  devise_for :users
  resources :profile, controller: "users", as: "users"

  authenticated :user do 
    root "users#index", as: "authenticated_root"
  end

  root "homepage#welcome"

end
