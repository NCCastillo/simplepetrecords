Simplepetrecords::Application.routes.draw do
  root :to => 'static_pages#home'

  resources :users do 
  	resources :pets do 
  		resources :vets, only: [:new, :create, :edit, :update, :destroy]
      resources :visits, only: [:new, :create, :edit, :update, :destroy]
      resources :immunizations, only: [:new, :create, :edit, :update, :destroy]
      resources :medications, only: [:new, :create, :edit, :update, :destroy]
      resources :conditions, only: [:new, :create, :edit, :update, :destroy]
  	end
  end
  resources :sessions, only: [:new, :create, :destroy]


  delete "/logout", to: "sessions#destroy"

  #note to self: code smell here. Think about refactoring to use its own address resource...
  get "users/:id/address" , to: "users#address", as: "user_address"
  get "users/:id/address/edit" , to: "users#address_edit", as: "edit_user_address"
  post "users/:id/address" , to: "users#address_create", as: "user_address"
  put "users/:id/address", to: "users#address_update", as: "update_user_address"


  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/contact"
  get "static_pages/test"
  

end
