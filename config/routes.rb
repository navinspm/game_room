Rails.application.routes.draw do
  resources :rooms do 
    member do
      get 'chat'
      get 'clear_role'
    end
    resources :messages
  end
  devise_for :users
  root "rooms#index"
end
