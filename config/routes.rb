Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  root to: 'public/homes#top'
  root to: "items#index"

  scope module: :public do
    get '/about' => 'homes#about'
    get '/complete' => 'orders#complete'
    post 'orders/check' => 'orders#check'
    resources :items
    resource :customers
    resources :cart_items
    resources :orders
    resources :addresses
  end
    devise_for :customers, controllers: { sessions: 'public/customers/sessions', passwords: 'public/customers/passwords', registrations: 'public/customers/registrations'}
    #devise_forで生成されるURLがcustomersのeditと一緒になるのを防ぐため。上の情報が先に呼び込まれる（上書きされない）

  namespace :admin do
    get '/' => 'homes#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders
  end
end