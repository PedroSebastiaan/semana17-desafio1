Rails.application.routes.draw do
  get 'catalog/index'
  get 'catalog/show/:id', to: 'catalog#show', as: 'show'
  get 'catalog/show/:id/:color_id', to: 'catalog#show_sizes', as: 'show_sizes'
  get 'home/index'
  devise_for :users
  devise_for :admins
  root to: "catalog#index"

  authenticate :admin do
    resources :products
    resources :categories
  end

  resource :cart, only: [:show, :update] do
    member do
      post :pay_with_paypal
      get  :process_paypal_payment
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
