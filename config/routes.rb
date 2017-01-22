Rails.application.routes.draw do

  resources :events
  
  get 'admin' => 'admin#index'
  put 'admin/:id' => 'admin#update'
  patch 'admin/:id' => 'admin#update'

  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  resources :bars do
    get 'map_location'
    get :map_locations, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'events#index'
end
