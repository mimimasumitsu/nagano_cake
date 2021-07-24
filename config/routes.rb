Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }
  devise_for :customers, skip: 'registrations'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :customer do
    get 'customers/sign_up' => 'devise/registrations#new', as: :new_customer_registration
    post 'customers' => 'devise/registrations#create', as: :customer_registration
  end
  root 'homes#top'
  get 'about' => 'homes#about'
  resources :items, only: [:index, :show]
  get 'customers/confirm' => 'customers#confirm'
  get 'customers' => 'customers#show'
  get 'customers/edit' => 'customers#edit'
  patch 'customers' => 'customers#update'
  patch 'customers/cancel' => 'customers#cancel'
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :update, :destroy, :create]
  resources :orders, only: [:new, :create, :index, :show]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/tahks' => 'orders#thanks'
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  namespace :admin do
    root 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end

end