Rails.application.routes.draw do
  devise_for :users
  root 'tops#index'
  resources :products, only: [:show, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    member do # 編集(edit用) usl: products/id/editのため
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    # member do
    #   get 'buy_edit'
    #   post 'buy_update'
    # end
  end
  resources :buys, only: [:edit, :update]
  resources :products do
    resources :images, only: [:create]
  end
  resources :destinations, only: [:new, :create, :show, :edit, :update]
  resources :users, only: [:show]

  resources :signup
  
end
