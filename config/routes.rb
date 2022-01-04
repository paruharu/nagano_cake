Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :admin do
    resources :items
    resources :genres
    resources :customers
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    root to: 'homes#top'
    get "/about" => "homes#about"

  end

  scope module: :public do
    resource :customers, except: [:show]
    resources :items, only: [:index, :show]
    resources :addresses
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete"  => "orders#complete"
    resources :orders

    root to: 'homes#top'
    get "/about" => "homes#about"
    get "/customers/my_page" => "customers#show"
    get "/customers/unsubscribe" => "customers#unsubscribe"
    patch "/customers/withdraw" => "customers#withdraw"



  end

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

end
