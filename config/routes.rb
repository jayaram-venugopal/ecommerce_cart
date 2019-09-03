Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: [:show, :create, :index]
      resources :orders, only: [:show, :create, :update]  do
        member do
          get :place_order
        end
      end
      resources :promotions, only: [] do
        collection do
          get :product_promotions
          get :cart_promotions
          post :create_product_promotion
          post :create_cart_promotion
        end
        member do
          put :update_product_promotion
          put :update_cart_promotion
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
