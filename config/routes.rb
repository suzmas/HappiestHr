Rails.application.routes.draw do
  resources :bars do
    get 'map_location'
    get :map_locations, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'bars#index'
end
