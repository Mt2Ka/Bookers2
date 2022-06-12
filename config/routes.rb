Rails.application.routes.draw do
  
  devise_for :users
  root to: "homes#top"
  get "about" => "homes#about", as: "about"
  get "information" => "homes#information", as: "information"
  resources :books
  resources :post_images,only:[:new,:create,:show,:edit,:index,:destroy]
  resources :users,only:[:show,:edit,:update,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
