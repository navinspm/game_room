Rails.application.routes.draw do
  resources :rooms do 
    member do
      get 'chat'
      get 'clear_role'
      get 'message_history'
    end
    resources :messages
  end
  devise_for :users
  root "rooms#index"
  resources :messages do
    collection do
      post 'show_button'
      post 'image_selection'
    end
  end
end
