Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: [:show, :create, :index]
      resources :orders, only: [:show, :create, :update]  do
        member do
          get :place_order
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
