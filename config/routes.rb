Rails.application.routes.draw do
  resources :products do
    resources :order_items, only: [:create]
  end

  resources :order_items, only: [:update, :destroy]
  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
