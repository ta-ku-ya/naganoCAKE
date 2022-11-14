Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
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
