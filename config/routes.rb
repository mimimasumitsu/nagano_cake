Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }

  # devise_for :customers, skip: 'registrations'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # devise_scope :customer do
  #   get 'customers/sign_up' => 'devise/registrations#new', as: :new_customer_registration
  #   post 'customers' => 'devise/registrations#create', as: :customer_registration
  # end
  root 'homes#top'
  get 'about' => 'homes#about'
  resources :items, only: [:index, :show]
  get 'customers/confirm' => 'customers#confirm'
  resource :customers, only: [:show, :edit, :update]

  patch 'customers/cancel' => 'customers#cancel'
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :update, :destroy, :create]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:new, :create, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  namespace :admin do
    root 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end

end