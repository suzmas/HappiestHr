Rails.application.routes.draw do
  resources :bars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'bars#index'
end
