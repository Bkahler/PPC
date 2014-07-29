PPC::Application.routes.draw do

  devise_for :users
  root to: "charts#index"

  resources :properties do
    collection { post :import }
  end

  resources :owners
  resources :owner_properties
  resources :charts
  resources :shapes

end



