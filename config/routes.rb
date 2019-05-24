Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :index]

  scope "/users/:id", :as => "user" do
    resources :bets, only: [:index, :new, :create, :show]
  end

  scope "/bets/:id", :as => "bet" do
    resources :comments, only: [:index, :new, :create]
  end
  resources :comments, only: [:edit, :update, :destroy]

end
