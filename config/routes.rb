Rails.application.routes.draw do
 
  get 'friendlists/index'
  get 'friendlist/new' => 'friendlists#new'
  post 'friendlists' => 'friendlists#create'
  get 'messages/index'
  get 'messages/new' => 'messages#new' #message_new_path
  get 'new_message' => 'messages#new'
  post 'messages' => 'messages#create'

  resources :sessions, only: [:new, :create]

  delete '/logout' => 'sessions#destroy'
  root "users#index"
  get 'taousermoi' => 'users#new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
