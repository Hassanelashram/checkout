Rails.application.routes.draw do
  resources :order_items
  resources :products
  resources :orders
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
