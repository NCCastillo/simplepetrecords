Simplepetrecords::Application.routes.draw do
  root :to => 'static_pages#home'

  resources :users do 
  	resources :pets
  end
  resources :sessions, only: [:new, :create, :destroy]

  delete "/logout", to: "sessions#destroy"

  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/contact"
  

end
