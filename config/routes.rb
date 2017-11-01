Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs
  resources :posts, only: [:destroy, :new, :show, :create] do
    resources :comments, only: [:new, :create, :show]
  end
end
