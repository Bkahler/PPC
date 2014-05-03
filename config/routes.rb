PPC::Application.routes.draw do
  devise_for :users
  root to: "properties#index"
  resources :properties
  resources :owners
  resources :owner_properties

end



