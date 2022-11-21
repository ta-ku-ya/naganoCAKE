Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root to: 'homes#top'

  get 'home/about' => 'homes#about', as: :about
  get '/customers/my page'
  get '/information/edit'
  get '/customers/update' => '/information'
  get '/customers/information/withdraw'
  get '/customers/unsubscribe'
   resources :customers, only: [:show, :edit, :update]
   resources :addresses, only: [:index, :create, :edit, :update, :destroy]
   resources :customers, only: [:show, :index]
  devise_scope :users do
    get '/customers', to: redirect("/customers/sign_up")
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  get  '/top' => 'homes#top'

   get 'items' => 'public/items#index'
  namespace :admin do
    resources :items, only: [:index, :new, :show, :create, :edit, :update]
    resources :genres, only: [:create, :edit, :update, :index]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :order, only: [:show]
    resources :order_details
  end
end
