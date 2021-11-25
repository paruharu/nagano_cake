Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  namespace :admin do
    resources :items
    resources :genres
    resources :customers
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    root to: 'homes#top'
    
  end

  scope module: :public do
    resources :customers
    resources :items, only: [:index, :show]
    resources :cart_items
    resources :orders
    resources :addresses
    root to: 'homes#top'
    get "/about" => "homes#about"
  end

  
end
