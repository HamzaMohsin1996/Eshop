Rails.application.routes.draw do


  devise_for :users

  resources :users

  resources :categories do
    member do
      get :category_products
      post :edit
    end
  end

  get 'products/index'
    resources :products do
      member do
        post :edit
      end
    end
    resources :checkout do
      collection  do
        post :payment
      end
    end
    resources :charges
    resources :deals do
      member do       
        get :selected_products
        get :edit
      end
      collection do
       get :deals_products
      end
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  resources :welcome
  resources :dashboard
  resources :carts do
    collection do
      post  :manage_product
    end
  end
  resources :orders
  resources :charges, only: [:new, :create]
end



