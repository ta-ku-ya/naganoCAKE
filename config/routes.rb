Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  get  '/top' => 'homes#top'

  get 'items' => 'public/items#index'
  namespace :admin do
    resources :items
  end
end
