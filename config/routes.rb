Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users

  resources :users, only: [:index,:show]
  resources :relationships,       only: [:create, :destroy]
  resources :posts, only: [:show, :index]
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
