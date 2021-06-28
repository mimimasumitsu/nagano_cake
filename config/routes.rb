Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#top'
  get 'about' => 'homes#about'
  resources :items, only: [:index, :show]
  resources :customers, only: [:show, :edit, :update]
  get 'customers/confirm' => 'customers#confirm'
  patch 'customers/cancel' => 'customers#cancel'
  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :orders, only: [:new, :create, :index, :show]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/tahks' => 'orders#thanks'
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  namespace :admin do
    get 'admin' => 'admin/homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end

end