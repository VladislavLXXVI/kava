Rails.application.routes.draw do
  devise_for :users


  resources :products, only: [:index, :new, :create, :edit, :update, :destroy] do
    member do
      get 'view' # Это создаст маршрут /products/:id/view для просмотра конкретного продукта
    end
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
    get 'login', to: 'devise/sessions#new'
    get 'logout', to: 'devise/sessions#destroy'
  end

  root 'main#graf'

  get 'contact', to: 'contact#follow', as: 'contact'

  get 'product_overview', to: 'product#index', as: 'product_overview'
end
