Rails.application.routes.draw do



  get 'trainers/show'

  get 'maps/index'

  resources :post_announcements, only: [:index,:show]
  resources :announcements, only: [:index,:show]
  resources :maps, only: [:index]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users

  resources :users, only: [:index,:show] do
    resources :replies, only: [:index] #過去の回答一覧
  end

  resources :relationships,       only: [:create, :destroy]

  resources :posts, only:[:index, :show, :create] do
  resources :likes, only: [:create, :destroy]
  resources :replies, only: [:new, :create, :show, :edit, :update, :destroy]
end

  # resources :replies, only: [:show, :update, :destroy]
  resources :messages, only:[:create]
  resources :rooms, only:[:create, :show, :index]
  
  root 'staticpages#home'
  get '/home', to:'staticpages#home'
  get '/contact', to:'staticpages#contact'
  get '/about', to:'staticpages#about'

  resources :users do
    member do
      get :following, :followers
    end
  end
end
