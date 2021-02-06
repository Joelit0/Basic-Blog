Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"

  resources :articles do
    resources :images
  end
end
