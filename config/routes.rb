Rails.application.routes.draw do

  # 管理者
  devise_for :admins, controllers: {
    sessions:'admins/sessions',
    passwords:'admins/passwords',
    registrations:'admins/registrations'
  }

  namespace :admins do
    resources :users, only: [:index, :edit, :show, :update]
    resources :post_images, only: [:index, :show]
    get '/top' => "homes#top"
  end

  # ユーザ
  root 'homes#top'

  get "search" => "users#search"

  get '/post_image/hashtag/:name' => 'post_images#hashtag'
  get '/post_image/hashtag' => 'post_images#hashtag'

  get "/post_images/search" => "post_images#search"

  post '/homes/guest_sign_in', to: 'homes#new_guest'

  devise_for :users, controllers: {
    sessions:'users/sessions',
    passwords:'users/passwords',
    registrations:'users/registrations'
  }

  get 'homes/top' => 'homes#top', as: 'user_top'
  get 'homes/about' => 'homes#about', as: 'user_about'

  resources :users, only: [:show, :edit, :update, :index] do
    member do
      get :following, :followers
      get :withdraw
      put :withdraw_done
    end
  end

  resources :post_images do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
