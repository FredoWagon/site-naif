Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :paintings, only: [:index, :new, :show, :update, :create, :destroy] do
    get :open_modal, on: :member
  end
  resources :illustrations, only: [:index]
  resources :bios, only: [:index, :update] do
    get :open_modal, on: :member
  end

end
