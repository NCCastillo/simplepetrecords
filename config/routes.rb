Simplepetrecords::Application.routes.draw do
  root :to => 'static_pages#home'

  resources :users do 
  	resources :pets
  end
  resources :sessions, only: [:new, :create, :destroy]


  delete "/logout", to: "sessions#destroy"

  #note: code smell here. Think about refactoring to use it own address resource...
  get "users/:id/address" , to: "users#address", as: "user_address"
  get "users/:id/address/edit" , to: "users#address_edit", as: "edit_user_address"
  post "users/:id/address" , to: "users#address_create", as: "user_address"
  put "users/:id/address", to: "users#address_update", as: "update_user_address"


  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/contact"
  

end
