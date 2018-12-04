Rails.application.routes.draw do

  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root 'root#index'
  resources :books do
    resource :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
