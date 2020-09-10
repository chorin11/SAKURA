Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:'admins/sessions',
    passwords:'admins/passwords',
    registrations:'admins/registrations'
  }

  namespace :admins do
    get '/top' => "homes#top"
  end

  root 'homes#top'

  devise_for :users, controllers: {
    sessions:'users/sessions',
    passwords:'users/passwords',
    registrations:'users/registrations'
  }

  get 'homes/top' => 'homes#top', as: 'user_top'
  get 'homes/about' => 'homes#about', as: 'user_about'

  resources :users, only: [:show, :edit, :update, :index] do
    member do
      get :withdraw
      put :withdraw_done
    end
  end

  resources :post_images do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
