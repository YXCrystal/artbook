Rails.application.routes.draw do
  get 'homepage/index'
  root "home#index"
end
