Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'pages#index'

  resources :pages, only: [:index, :update] do
    get :open_modal, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :paintings, only: [:index, :new, :show, :update, :create, :destroy] do
    get :open_modal, on: :member
  end
  resources :illustrations, only: [:index]
  resources :bios, only: [:index, :update] do
    get :open_text, on: :collection
    get :open_modal, on: :collection
  end

  resources :instas, only: [:index, :create, :webhook] do
    collection do
      post :refresh
      delete :destroy_all
      post :webhook
    end
  end


end
