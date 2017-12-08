Rails.application.routes.draw do
  resources :pages do
    resources :urls do
      member do
        get :capture
      end
    end
  end
  resources :captures
  resources :urls
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users
  root 'homes#index'
end
