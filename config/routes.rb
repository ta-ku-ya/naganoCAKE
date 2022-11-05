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
    resources :items, only: [:index, :new, :create]
    resources :genres, only: [:new, :create, :edit, :update,:index, :show, :destroy]
    resources :order
    resources :order_details
  end
end
