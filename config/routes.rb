Rails.application.routes.draw do
  
  root 'landing#index'
  devise_for :users
  resources :users, only: [:show, :update], controller: :profiles
  resource :profile
  resources :photos do
    resources :comments 
  end
  get '/followers' => 'followers#index'
  get '/following' => 'following#index'
  get '/feed' => 'feed#index'
  
  resources :conversations do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
