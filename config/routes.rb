PPC::Application.routes.draw do

  devise_for :users
  root to: "properties#index"

  resources :properties do
    collection { post :import }
  end

  resources :owners
  resources :owner_properties
  resources :charts

end



