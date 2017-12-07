Rails.application.routes.draw do
  resources :captures
  resources :urls
#  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users
  root 'homes#index'
end
